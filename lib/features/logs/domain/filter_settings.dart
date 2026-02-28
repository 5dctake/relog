import 'package:isar/isar.dart';
import 'log_entry.dart';

part 'filter_settings.g.dart';

@collection
class FilterSettings {
  Id id = Isar.autoIncrement;

  /// フィルタ名 (例: 「要改善リスト」)
  late String name;

  /// 日付範囲
  DateTime? startDate;
  DateTime? endDate;

  /// 評価範囲
  double? minRating;
  double? maxRating;

  /// カテゴリ
  List<String> categories = [];

  /// タグ
  List<String> tags = [];

  /// キーワード
  String? keyword;

  /// 気分スタンプ
  @enumerated
  List<Mood> moods = [];

  /// 写真の有無
  bool? hasPhoto;

  /// コスト範囲
  double? minCost;
  double? maxCost;

  /// 作成日時
  DateTime createdAt = DateTime.now();
}
