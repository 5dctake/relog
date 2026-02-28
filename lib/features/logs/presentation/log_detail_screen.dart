import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/log_entry.dart';
import '../data/logs_repository.dart';
import 'log_edit_screen.dart';
import '../../../shared/widgets/star_rating.dart';

class LogDetailScreen extends ConsumerWidget {
  final LogEntry log;

  const LogDetailScreen({super.key, required this.log});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('記録の詳細'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogEditScreen(log: log)),
              );
            },
            tooltip: '編集',
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: '削除',
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('記録を削除しますか？'),
                    content: const Text('この操作は元に戻せません。'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('キャンセル', style: TextStyle(color: Colors.grey)),
                      ),
                      TextButton(
                        onPressed: () async {
                          Navigator.pop(context); // 閉じる
                          final repository = await ref.read(logsRepositoryProvider.future);
                          await repository.deleteLog(log.id);
                          if (context.mounted) {
                            Navigator.pop(context); // 一覧画面に戻る
                          }
                        },
                        child: const Text('削除', style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            // ヘッダーエリア（日付と気分）
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('yyyy年MM月dd日').format(log.date),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      DateFormat('HH:mm').format(log.date),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      log.mood.emoji,
                      style: const TextStyle(fontSize: 48),
                    ),
                    Text(
                      log.mood.label,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),

            // タイトル
            Text(
              log.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),

            // 評価
            Row(
              children: [
                StarRating(rating: log.rating, size: 28),
                const SizedBox(width: 12),
                Text(
                  log.rating.toString(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // カテゴリ
            if (log.categories.isNotEmpty) ...[
              const Text('📂 カテゴリ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: log.categories.map((cat) => Chip(
                  label: Text(cat, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                )).toList(),
              ),
              const SizedBox(height: 32),
            ],

            // ひとこと / メモ
            const Text('💬 ひとこと', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
              ),
              child: Text(
                log.note ?? '（メモはありません）',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1.6,
                    ),
              ),
            ),
            
            if (log.imagePaths.isNotEmpty) ...[
              const SizedBox(height: 32),
              const Text('📷 写真', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
              const SizedBox(height: 8),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: log.imagePaths.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        File(log.imagePaths[index]),
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ],
            
            const SizedBox(height: 32), // 下部の余白
          ],
        ),
          ),
        ),
      ),
    );
  }
}
