import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../logs/domain/log_entry.dart';
import '../../../core/database/app_config_repository.dart';

class FilterDialog extends ConsumerStatefulWidget {
  final String? selectedCategory;
  final Mood? selectedMood;
  final double? minRating;
  final String? keyword;
  final DateTime? startDate;
  final DateTime? endDate;

  const FilterDialog({
    super.key,
    this.selectedCategory,
    this.selectedMood,
    this.minRating,
    this.keyword,
    this.startDate,
    this.endDate,
  });

  @override
  ConsumerState<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends ConsumerState<FilterDialog> {
  String? _category;
  Mood? _mood;
  double? _minRating;
  late TextEditingController _keywordController;
  DateTime? _startDate;
  DateTime? _endDate;

  List<String> _categories = [];
  bool _isLoadingCategories = true;

  final List<String> _defaultCategories = [
    '仕事', '人間関係', '趣味', '体験', '学び', '買い物', '健康', 'その他'
  ];

  @override
  void initState() {
    super.initState();
    _category = widget.selectedCategory;
    _mood = widget.selectedMood;
    _minRating = widget.minRating;
    _keywordController = TextEditingController(text: widget.keyword);
    _startDate = widget.startDate;
    _endDate = widget.endDate;

    _loadCategories();
  }

  Future<void> _loadCategories() async {
    final repository = await ref.read(appConfigRepositoryProvider.future);
    final config = await repository.getConfig();
    if (mounted) {
      setState(() {
        if (config.customCategories.isEmpty) {
          _categories = List.from(_defaultCategories);
        } else {
          _categories = List.from(config.customCategories);
        }
        _isLoadingCategories = false;
      });
    }
  }

  @override
  void dispose() {
    _keywordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      title: const Text('フィルタ', style: TextStyle(fontWeight: FontWeight.bold)),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('🔍 キーワードで検索', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _keywordController,
              decoration: const InputDecoration(
                hintText: 'タイトルやメモから検索...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 24),
            const Text('🎯 フィルタ条件', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('カテゴリ', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 4),
                  _isLoadingCategories 
                    ? const Center(child: CircularProgressIndicator())
                    : DropdownButtonFormField<String>(
                        isExpanded: true,
                        value: _category,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        hint: const Text('すべて'),
                        items: [
                          const DropdownMenuItem(value: null, child: Text('すべて')),
                          ..._categories.map((c) => DropdownMenuItem(value: c, child: Text(c))),
                        ],
                        onChanged: (val) => setState(() => _category = val),
                      ),
                  const SizedBox(height: 16),
                  const Text('最低評価', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Slider(
                    value: _minRating ?? 1.0,
                    min: 1.0,
                    max: 5.0,
                    divisions: 4,
                    label: _minRating?.toString() ?? 'すべて',
                    onChanged: (val) => setState(() => _minRating = val),
                  ),
                  const SizedBox(height: 8),
                  const Text('気分', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ChoiceChip(
                        label: const Text('すべて'),
                        selected: _mood == null,
                        showCheckmark: false,
                        onSelected: (_) => setState(() => _mood = null),
                      ),
                      ...Mood.values.map((m) => ChoiceChip(
                        label: Text('${m.emoji} ${m.label}'),
                        selected: _mood == m,
                        showCheckmark: false,
                        onSelected: (selected) => setState(() => _mood = selected ? m : null),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('📅 期間指定', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: _startDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) setState(() => _startDate = picked);
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: Text(_startDate == null ? '開始日' : DateFormat('yyyy/MM/dd').format(_startDate!)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('〜'),
                ),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: _endDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) setState(() => _endDate = picked);
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: Text(_endDate == null ? '終了日' : DateFormat('yyyy/MM/dd').format(_endDate!)),
                  ),
                ),
              ],
            ),
            if (_startDate != null || _endDate != null)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => setState(() {
                    _startDate = null;
                    _endDate = null;
                  }),
                  child: const Text('期間指定をクリア', style: TextStyle(fontSize: 12)),
                ),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('キャンセル', style: TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, {
              'category': _category,
              'mood': _mood,
              'minRating': _minRating,
              'keyword': _keywordController.text,
              'startDate': _startDate,
              'endDate': _endDate,
            });
          },
          child: const Text('適用', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
