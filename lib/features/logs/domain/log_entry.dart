import 'package:isar/isar.dart';

part 'log_entry.g.dart';

@collection
class LogEntry {
  Id id = Isar.autoIncrement;

  /// ⭐ 評価 (1〜5, 0.5刻み)
  double rating = 3.0;

  /// 📅 日付
  DateTime date = DateTime.now();

  /// 🏷 タイトル
  @Index(type: IndexType.value)
  late String title;

  /// 📂 カテゴリ (複数選択可)
  List<String> categories = [];

  /// 🏷 タグ (自由入力)
  List<String> tags = [];

  /// 💬 ひとこと
  String? note;

  /// 📸 写真 (最大3枚、パスを保存)
  List<String> imagePaths = [];

  /// 😶 気分
  @enumerated
  Mood mood = Mood.nothing;

  /// 最終更新日時
  DateTime updatedAt = DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'date': date.toIso8601String(),
      'title': title,
      'categories': categories,
      'tags': tags,
      'note': note,
      'imagePaths': imagePaths,
      'mood': mood.index,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  static LogEntry fromJson(Map<String, dynamic> json) {
    return LogEntry()
      ..rating = (json['rating'] as num).toDouble()
      ..date = DateTime.parse(json['date'])
      ..title = json['title'] as String
      ..categories = List<String>.from(json['categories'])
      ..tags = List<String>.from(json['tags'])
      ..note = json['note'] as String?
      ..imagePaths = List<String>.from(json['imagePaths'])
      ..mood = Mood.values[json['mood'] as int]
      ..updatedAt = DateTime.parse(json['updatedAt']);
  }
}

enum Mood {
  /// 😆 喜
  joy,
  /// 😡 怒
  anger,
  /// 😢 哀
  sorrow,
  /// ✨ 楽
  fun,
  /// 😶 無
  nothing;

  String get label {
    switch (this) {
      case Mood.joy: return '喜';
      case Mood.anger: return '怒';
      case Mood.sorrow: return '哀';
      case Mood.fun: return '楽';
      case Mood.nothing: return '無';
    }
  }

  String get emoji {
    switch (this) {
      case Mood.joy: return '😆';
      case Mood.anger: return '😡';
      case Mood.sorrow: return '😢';
      case Mood.fun: return '🥳';
      case Mood.nothing: return '😶';
    }
  }
}
