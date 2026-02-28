import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../logs/data/logs_repository.dart';
import '../../logs/domain/log_entry.dart';
import '../../logs/presentation/log_detail_screen.dart';
import '../../logs/presentation/logs_list_screen.dart';
import '../domain/monthly_report.dart';
import '../data/report_repository.dart';

class MonthlyReportScreen extends ConsumerStatefulWidget {
  const MonthlyReportScreen({super.key});

  @override
  ConsumerState<MonthlyReportScreen> createState() => _MonthlyReportScreenState();
}

class _MonthlyReportScreenState extends ConsumerState<MonthlyReportScreen> {
  // デフォルトで「前月」を表示するように変更（月末レポートの特性上）
  late DateTime _selectedMonth;
  MonthlyReport? _currentReport;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _selectedMonth = DateTime(now.year, now.month - 1);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadReport();
    });
  }

  @override
  void didUpdateWidget(MonthlyReportScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _loadReport();
  }

  Future<void> _loadReport() async {
    final repo = await ref.read(reportRepositoryProvider.future);
    final report = await repo.getReport(_selectedMonth.year, _selectedMonth.month);
    if (mounted) {
      setState(() {
        _currentReport = report;
      });
    }
  }

  void _changeMonth(int delta) {
    setState(() {
      _selectedMonth = DateTime(_selectedMonth.year, _selectedMonth.month + delta);
    });
    _loadReport();
  }

  @override
  Widget build(BuildContext context) {
    final logsAsync = ref.watch(logsRepositoryProvider.future);

    return Scaffold(
      appBar: AppBar(
        title: const Text('月末レポート'),
      ),
      body: FutureBuilder(
        future: logsAsync,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final logsRepo = snapshot.data as LogsRepository;
          
          return StreamBuilder<List<LogEntry>>(
            // watchLogs を拡張して特定月のフィルタリングができるようにすべきだが、
            // 今回は全件取得後にフィルタリングして提示する（簡易実装）
            stream: logsRepo.watchLogs(), 
            builder: (context, streamSnapshot) {
              if (!streamSnapshot.hasData) return const Center(child: CircularProgressIndicator());
              
              final allLogs = streamSnapshot.data!;
              final monthlyLogs = allLogs.where((l) => 
                l.date.year == _selectedMonth.year && l.date.month == _selectedMonth.month
              ).toList();

              if (monthlyLogs.isEmpty) {
                return Center(child: Text('${_selectedMonth.month}月の記録はありません。'));
              }

              final stats = _calculateStats(monthlyLogs);

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 月選択ナビゲーション
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.chevron_left),
                          onPressed: () => _changeMonth(-1),
                        ),
                        InkWell(
                          onTap: () async {
                            final now = DateTime.now();
                            final picked = await showDatePicker(
                              context: context,
                              initialDate: _selectedMonth,
                              firstDate: DateTime(2000),
                              lastDate: now,
                              initialDatePickerMode: DatePickerMode.year,
                              helpText: '表示する月を指定',
                            );
                            if (picked != null) {
                              setState(() {
                                _selectedMonth = DateTime(picked.year, picked.month);
                              });
                              _loadReport();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Text(
                              '${_selectedMonth.year}年${_selectedMonth.month}月',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.chevron_right),
                          onPressed: (_selectedMonth.year >= DateTime.now().year && _selectedMonth.month >= DateTime.now().month)
                              ? null
                              : () => _changeMonth(1),
                        ),
                      ],
                    ),
                    const Center(
                      child: Text('おつかれさまでした', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ),
                    const SizedBox(height: 16),
                    const SizedBox(height: 16),
                    _buildSummaryCard(stats),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LogsListScreen(month: _selectedMonth),
                            ),
                          );
                        },
                        icon: const Icon(Icons.list),
                        label: Text('${_selectedMonth.month}月のログをすべて見る'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildBestWorstSection(stats),
                    const SizedBox(height: 16),
                    _buildCategorySection(stats),
                    const SizedBox(height: 24),
                    const Text('今月の振り返り', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Card(
                      margin: EdgeInsets.zero,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          _currentReport?.note?.isNotEmpty == true 
                              ? _currentReport!.note! 
                              : '（振り返りのコメントはありません）',
                          style: const TextStyle(height: 1.5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 48),
                    const SizedBox(height: 48),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildSummaryCard(_Stats stats) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatItem('記録数', '${stats.totalCount}件'),
            _buildStatItem('平均評価', '★${stats.averageRating.toStringAsFixed(1)}'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildBestWorstSection(_Stats stats) {
    return Column(
      children: [
        if (stats.bestLog != null)
          _buildLogHighlightTile('今月よかったやつ', stats.bestLog!, Colors.green),
        const SizedBox(height: 8),
        if (stats.worstLog != null)
          _buildLogHighlightTile('ちょっと微妙だったやつ', stats.worstLog!, Colors.orange),
      ],
    );
  }

  Widget _buildLogHighlightTile(String label, LogEntry log, Color color) {
    return Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text(label, style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.bold)),
        subtitle: Text(
          log.title.length > 15 ? '${log.title.substring(0, 15)}...' : log.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        trailing: Text('★${log.rating}', style: const TextStyle(fontWeight: FontWeight.bold)),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LogDetailScreen(log: log)));
        },
      ),
    );
  }

  Widget _buildCategorySection(_Stats stats) {
    if (stats.categoryAverages.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('カテゴリ別平均', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: stats.categoryAverages.entries.map((e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e.key),
                    Text('★${e.value.toStringAsFixed(1)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              )).toList(),
            ),
          ),
        ),
      ],
    );
  }

  _Stats _calculateStats(List<LogEntry> logs) {
    final double avg = logs.isEmpty ? 0 : logs.fold(0.0, (s, l) => s + l.rating) / logs.length;
    
    LogEntry? best;
    if (logs.isNotEmpty) {
      final max = logs.map((l) => l.rating).reduce((a, b) => a > b ? a : b);
      final bests = logs.where((l) => l.rating == max).toList()..shuffle();
      best = bests.first;
    }

    LogEntry? worst;
    if (logs.isNotEmpty) {
       final min = logs.map((l) => l.rating).reduce((a, b) => a < b ? a : b);
       final worsts = logs.where((l) => l.rating == min).toList()..shuffle();
       worst = worsts.first;
    }

    final Map<String, List<double>> catRatings = {};
    for (var l in logs) {
      for (var c in l.categories) {
        catRatings.putIfAbsent(c, () => []).add(l.rating);
      }
    }
    final Map<String, double> catAvgs = {};
    catRatings.forEach((k, v) => catAvgs[k] = v.reduce((a, b) => a + b) / v.length);

    return _Stats(logs.length, avg, best, worst, catAvgs);
  }
}

class _Stats {
  final int totalCount;
  final double averageRating;
  final LogEntry? bestLog;
  final LogEntry? worstLog;
  final Map<String, double> categoryAverages;

  _Stats(this.totalCount, this.averageRating, this.bestLog, this.worstLog, this.categoryAverages);
}
