import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';
import '../../logs/data/logs_repository.dart';
import '../../../core/theme/theme_provider.dart';
import 'category_settings_screen.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  Future<void> _export(BuildContext context, WidgetRef ref) async {
    final repository = await ref.read(logsRepositoryProvider.future);
    final json = await repository.exportToJson();
    
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/relog_backup.json');
    await file.writeAsString(json);
    
    if (context.mounted) {
      await Share.shareXFiles([XFile(file.path)], text: 'ReLog ログバックアップ');
    }
  }

  Future<void> _import(BuildContext context, WidgetRef ref) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );
    
    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      final json = await file.readAsString();
      
      final repository = await ref.read(logsRepositoryProvider.future);
      await repository.importFromJson(json);
      
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('インポートが完了しました')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text('データ管理', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal)),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.download),
                  title: const Text('データをエクスポート (JSON)'),
                  subtitle: const Text('現在のすべての記録をファイルに保存します'),
                  onTap: () => _export(context, ref),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.upload),
                  title: const Text('データをインポート (JSON)'),
                  subtitle: const Text('バックアップファイルから記録を復元します'),
                  onTap: () => _import(context, ref),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const ListTile(
            title: Text('カスタマイズ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal)),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: ListTile(
              leading: const Icon(Icons.category),
              title: const Text('カテゴリの編集'),
              subtitle: const Text('独自のカテゴリを追加・削除します'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const CategorySettingsScreen(),
                ));
              },
            ),
          ),
          const SizedBox(height: 16),
          const ListTile(
            title: Text('テーマ設定', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal)),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Column(
              children: AppTheme.values.map((theme) {
                final currentTheme = ref.watch(themeProvider);
                return RadioListTile<AppTheme>(
                  title: Text(theme.label),
                  value: theme,
                  groupValue: currentTheme,
                  activeColor: Theme.of(context).colorScheme.primary,
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(themeProvider.notifier).setTheme(value);
                    }
                  },
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          const ListTile(
            title: Text('アプリについて', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal)),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: const ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('バージョン'),
              trailing: Text('1.0.0'),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
