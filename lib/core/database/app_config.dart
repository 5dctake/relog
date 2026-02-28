import 'package:isar/isar.dart';

part 'app_config.g.dart';

@collection
class AppConfig {
  Id id = Isar.autoIncrement;

  /// 最後に月末レポートを表示した年月 (例: "2024-02")
  String? lastReportViewedMonth;

  /// カスタムカテゴリリスト
  List<String> customCategories = [];

  /// その他の設定が必要な場合はここに追加
  AppConfig();
}
