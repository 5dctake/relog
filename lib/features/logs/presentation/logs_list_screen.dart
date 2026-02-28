import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../data/logs_repository.dart';
import '../domain/log_entry.dart';
import 'filter_dialog.dart';
import 'log_edit_screen.dart';
import 'log_detail_screen.dart';
import '../../../shared/widgets/star_rating.dart';

final logSortByRatingProvider = StateProvider<bool>((ref) => false);
final logSortDescProvider = StateProvider<bool>((ref) => true);
final logCategoryFilterProvider = StateProvider<String?>((ref) => null);
final logMoodFilterProvider = StateProvider<Mood?>((ref) => null);
final logMinRatingFilterProvider = StateProvider<double?>((ref) => null);
final logSearchQueryProvider = StateProvider<String?>((ref) => null);
final logStartDateProvider = StateProvider<DateTime?>((ref) => null);
final logEndDateProvider = StateProvider<DateTime?>((ref) => null);

class LogsListScreen extends ConsumerWidget {
  final DateTime? month;
  const LogsListScreen({super.key, this.month});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final selectedMonth = month ?? DateTime(now.year, now.month);

    final logsAsync = ref.watch(logsRepositoryProvider.future);
    final isSortByRating = ref.watch(logSortByRatingProvider);
    final isSortDesc = ref.watch(logSortDescProvider);
    final categoryFilter = ref.watch(logCategoryFilterProvider);
    final moodFilter = ref.watch(logMoodFilterProvider);
    final minRatingFilter = ref.watch(logMinRatingFilterProvider);
    final searchQuery = ref.watch(logSearchQueryProvider);
    final startDateFilter = ref.watch(logStartDateProvider);
    final endDateFilter = ref.watch(logEndDateProvider);

    // タイトルの決定
    String displayTitle = 'すべてのログ';
    if (month != null) {
      displayTitle = DateFormat('yyyy年MM月のログ').format(month!);
    } else if (searchQuery?.isNotEmpty == true) {
      displayTitle = '検索: $searchQuery';
    } else if (startDateFilter != null && endDateFilter != null) {
      displayTitle = '${DateFormat('MM/dd').format(startDateFilter)}〜${DateFormat('MM/dd').format(endDateFilter)}';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(displayTitle),
        actions: [
          IconButton(
            icon: Icon(
              Icons.filter_list,
              color: (categoryFilter != null || moodFilter != null || minRatingFilter != null || searchQuery != null || startDateFilter != null || endDateFilter != null)
                  ? Theme.of(context).colorScheme.primary
                  : null,
            ),
            onPressed: () async {
              final result = await showDialog<Map<String, dynamic>>(
                context: context,
                builder: (context) => FilterDialog(
                  selectedCategory: categoryFilter,
                  selectedMood: moodFilter,
                  minRating: minRatingFilter,
                  keyword: searchQuery,
                  startDate: startDateFilter,
                  endDate: endDateFilter,
                ),
              );
              if (result != null) {
                ref.read(logCategoryFilterProvider.notifier).state = result['category'];
                ref.read(logMoodFilterProvider.notifier).state = result['mood'];
                ref.read(logMinRatingFilterProvider.notifier).state = result['minRating'];
                ref.read(logSearchQueryProvider.notifier).state = result['keyword'];
                ref.read(logStartDateProvider.notifier).state = result['startDate'];
                ref.read(logEndDateProvider.notifier).state = result['endDate'];
              }
            },
            tooltip: '検索・フィルタ',
          ),
          IconButton(
            icon: Icon(isSortByRating ? Icons.star : Icons.calendar_today),
            onPressed: () {
              ref.read(logSortByRatingProvider.notifier).update((s) => !s);
            },
            tooltip: 'ソート切り替え (日付/評価)',
          ),
        ],
      ),
      body: FutureBuilder(
        future: logsAsync,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final repository = snapshot.data as LogsRepository;
          return StreamBuilder<List<LogEntry>>(
            stream: repository.watchLogs(
              sortByRating: isSortByRating,
              ratingDesc: isSortDesc,
              dateDesc: isSortDesc,
              category: categoryFilter,
              mood: moodFilter,
              minRating: minRatingFilter,
              year: month?.year,
              month: month?.month,
              searchQuery: searchQuery,
              startDate: startDateFilter,
              endDate: endDateFilter,
            ),
            builder: (context, streamSnapshot) {
              if (streamSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              final logs = streamSnapshot.data ?? [];
              
              if (logs.isEmpty) {
                return const Center(
                  child: Text('まだ記録がありません。\n右下のボタンから作成しましょう！', textAlign: TextAlign.center),
                );
              }

              // 月ごとにグルーピングするためのリスト作成
              final listItems = <dynamic>[];
              DateTime? lastMonth;
              for (final log in logs) {
                final monthDate = DateTime(log.date.year, log.date.month);
                if (lastMonth == null || monthDate != lastMonth) {
                  listItems.add(monthDate);
                  lastMonth = monthDate;
                }
                listItems.add(log);
              }

              return ListView.builder(
                itemCount: listItems.length,
                itemBuilder: (context, index) {
                  final item = listItems[index];

                  if (item is DateTime) {
                    final isCurrentYear = item.year == DateTime.now().year;
                    final format = isCurrentYear ? 'MM月' : 'yyyy年MM月';
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, top: 16, bottom: 8),
                      child: Text(
                        DateFormat(format).format(item),
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }

                  final log = item as LogEntry;
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LogDetailScreen(log: log)),
                        );
                      },
                      leading: Text(
                        log.mood.emoji,
                        style: const TextStyle(fontSize: 24),
                      ),
                      title: Text(
                        log.title.length > 20 ? '${log.title.substring(0, 20)}...' : log.title,
                      ),
                      subtitle: Row(
                        children: [
                          StarRating(rating: log.rating, size: 16),
                          const SizedBox(width: 8),
                          Text(
                            DateFormat('MM/dd HH:mm').format(log.date),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.chevron_right, size: 20),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LogEditScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
