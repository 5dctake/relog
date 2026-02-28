import 'package:isar/isar.dart';
import '../../logs/domain/log_entry.dart';

part 'monthly_report.g.dart';

@collection
class MonthlyReport {
  Id id = Isar.autoIncrement;

  late int year;
  late int month;

  /// 今月のひとこと
  String? note;

  /// 集計データ (Isarには保存せず、都度計算するか、静的データを保存するか検討)
  /// 今回はシンプルに、保存するのは「ひとこと」と「年月」のみとし、
  /// 統計値は表示時に動的に計算する。
  
  MonthlyReport();

  // 計算用ヘルパー（UI側で使用）
  static double calculateAverage(List<LogEntry> logs) {
    if (logs.isEmpty) return 0.0;
    final total = logs.fold(0.0, (sum, log) => sum + log.rating);
    return total / logs.length;
  }
}
