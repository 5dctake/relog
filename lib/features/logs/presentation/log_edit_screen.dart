import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import '../domain/log_entry.dart';
import '../data/logs_repository.dart';
import '../../../core/database/app_config_repository.dart';
import '../../../core/ads/ad_service.dart';
import '../../../shared/widgets/star_rating.dart';

class LogEditScreen extends ConsumerStatefulWidget {
  final LogEntry? log;

  const LogEditScreen({super.key, this.log});

  @override
  ConsumerState<LogEditScreen> createState() => _LogEditScreenState();
}

class _LogEditScreenState extends ConsumerState<LogEditScreen> {
  late TextEditingController _titleController;
  late TextEditingController _noteController;
  late double _rating;
  late DateTime _date;
  late Mood _mood;
  late List<String> _selectedCategories;
  late List<String> _tags;
  List<String> _imagePaths = [];

  List<String> _categories = [];
  bool _isLoadingCategories = true;

  final List<String> _defaultCategories = [
    '仕事',
    '人間関係',
    '趣味',
    '体験',
    '学び',
    '買い物',
    '健康',
    'その他',
  ];

  @override
  void initState() {
    super.initState();
    final log = widget.log;
    _titleController = TextEditingController(text: log?.title ?? '');
    _noteController = TextEditingController(text: log?.note ?? '');
    _rating = log?.rating ?? 3.0;
    _date = log?.date ?? DateTime.now();
    _mood = log?.mood ?? Mood.nothing;
    _selectedCategories = List.from(log?.categories ?? []);
    _tags = List.from(log?.tags ?? []);
    _imagePaths = List.from(log?.imagePaths ?? []);

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
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_titleController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('タイトルを入力してください')));
      return;
    }

    final repository = await ref.read(logsRepositoryProvider.future);
    final log = widget.log ?? LogEntry();

    log.title = _titleController.text;
    log.rating = _rating;
    log.date = _date;
    log.mood = _mood;
    log.note = _noteController.text.isEmpty ? null : _noteController.text;
    log.categories = _selectedCategories;
    log.tags = _tags;
    log.imagePaths = _imagePaths;
    log.updatedAt = DateTime.now();

    await repository.saveLog(log);

    if (mounted) {
      // 広告表示（指示書：ログ保存ボタンを押した直後に表示）
      ref
          .read(adServiceProvider)
          .showInterstitialAd(
            onAdDismissed: () {
              if (mounted) Navigator.pop(context);
            },
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.log == null ? '新しい記録' : '記録を編集')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // クイック入力エリア
                const Text(
                  '⭐ 評価',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Center(
                  child: StarRating(
                    rating: _rating,
                    size: 48,
                    onRatingChanged: (rating) =>
                        setState(() => _rating = rating),
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'タイトル *',
                    hintText: '何がありましたか？',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                  enableSuggestions: true,
                ),
                const SizedBox(height: 24),

                // 詳細設定（ExpansionTileまたはそのまま展開）
                const Divider(),
                const SizedBox(height: 8),
                const Text(
                  '詳細設定',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 16),

                // 日付選択
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.calendar_today),
                  title: const Text('日付'),
                  trailing: Text(DateFormat('yyyy/MM/dd').format(_date)),
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _date,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) setState(() => _date = picked);
                  },
                ),

                // 気分スタンプ
                const SizedBox(height: 16),
                const Text(
                  '😶 今の気分',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: Mood.values.map((m) {
                    final isSelected = _mood == m;
                    return GestureDetector(
                      onTap: () => setState(() => _mood = m),
                      child: Column(
                        children: [
                          Opacity(
                            opacity: isSelected ? 1.0 : 0.4,
                            child: Text(
                              m.emoji,
                              style: const TextStyle(fontSize: 32),
                            ),
                          ),
                          Text(
                            m.label,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: isSelected
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),

                // カテゴリ
                const SizedBox(height: 24),
                const Text(
                  '📂 カテゴリ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _isLoadingCategories
                    ? const CircularProgressIndicator()
                    : Wrap(
                        spacing: 8,
                        children: _categories.map((cat) {
                          final isSelected = _selectedCategories.contains(cat);
                          return FilterChip(
                            label: Text(cat),
                            selected: isSelected,
                            onSelected: (selected) {
                              setState(() {
                                if (selected) {
                                  _selectedCategories.add(cat);
                                } else {
                                  _selectedCategories.remove(cat);
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),

                // ひとこと
                const SizedBox(height: 24),
                TextFormField(
                  controller: _noteController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'ひとこと',
                    hintText: '詳しい内容をメモ...',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  autocorrect: false,
                  enableSuggestions: true,
                ),

                const SizedBox(height: 24),
                const Text(
                  '📷 写真 (最大3枚)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ..._imagePaths.asMap().entries.map((entry) {
                      final index = entry.key;
                      final path = entry.value;
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              File(path),
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: -8,
                            right: -8,
                            child: IconButton(
                              icon: const Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                setState(() => _imagePaths.removeAt(index));
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                    if (_imagePaths.length < 3)
                      InkWell(
                        onTap: () async {
                          final picker = ImagePicker();
                          final List<XFile> images = await picker
                              .pickMultiImage();
                          if (images.isNotEmpty) {
                            setState(() {
                              for (var img in images) {
                                if (_imagePaths.length < 3) {
                                  _imagePaths.add(img.path);
                                }
                              }
                            });
                          }
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: const Icon(
                            Icons.add_a_photo,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 32), // 下部のスペース
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _save,
        label: const Text(
          '保存して動画広告を見る',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.play_circle_outline),
      ),
    );
  }
}
