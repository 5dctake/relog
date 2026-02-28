import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/app_config_repository.dart';

class CategorySettingsScreen extends ConsumerStatefulWidget {
  const CategorySettingsScreen({super.key});

  @override
  ConsumerState<CategorySettingsScreen> createState() => _CategorySettingsScreenState();
}

class _CategorySettingsScreenState extends ConsumerState<CategorySettingsScreen> {
  final List<String> _defaultCategories = [
    '仕事', '人間関係', '趣味', '体験', '学び', '買い物', '健康', 'その他'
  ];
  List<String> _categories = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    final repository = await ref.read(appConfigRepositoryProvider.future);
    final config = await repository.getConfig();
    setState(() {
      if (config.customCategories.isEmpty) {
        _categories = List.from(_defaultCategories);
      } else {
        _categories = List.from(config.customCategories);
      }
      _isLoading = false;
    });
  }

  Future<void> _saveCategories() async {
    final repository = await ref.read(appConfigRepositoryProvider.future);
    await repository.updateCustomCategories(_categories);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('カテゴリを保存しました')),
      );
    }
  }

  void _addCategory() {
    showDialog(
      context: context,
      builder: (context) {
        String newCat = '';
        return AlertDialog(
          title: const Text('カテゴリを追加'),
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(hintText: '新しいカテゴリ名'),
            onChanged: (val) => newCat = val,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('キャンセル'),
            ),
            ElevatedButton(
              onPressed: () {
                if (newCat.trim().isNotEmpty && !_categories.contains(newCat.trim())) {
                  setState(() => _categories.add(newCat.trim()));
                  _saveCategories();
                }
                Navigator.pop(context);
              },
              child: const Text('追加'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('カテゴリの編集'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final cat = _categories[index];
          return ListTile(
            title: Text(cat),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.grey),
              onPressed: () {
                if (_categories.length <= 1) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('カテゴリは最低1つ必要です')),
                  );
                  return;
                }
                setState(() => _categories.removeAt(index));
                _saveCategories();
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCategory,
        child: const Icon(Icons.add),
      ),
    );
  }
}
