import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/database/isar_service.dart';
import '../domain/monthly_report.dart';

part 'report_repository.g.dart';

class ReportRepository {
  final Isar _isar;

  ReportRepository(this._isar);

  /// レポート（ひとこと等）を保存する
  Future<void> saveReport(MonthlyReport report) async {
    await _isar.writeTxn(() async {
      await _isar.monthlyReports.put(report);
    });
  }

  /// 指定年月のレポートを取得する
  Future<MonthlyReport?> getReport(int year, int month) async {
    return _isar.monthlyReports.filter().yearEqualTo(year).and().monthEqualTo(month).findFirst();
  }

  /// 全てのレポートを監視する
  Stream<List<MonthlyReport>> watchAllReports() {
    // where().sortBy... は Isar v3 で NoSuchMethodError になるため filter() を使用
    return _isar.monthlyReports.filter().idGreaterThan(-1)
        .sortByYearDesc().thenByMonthDesc()
        .watch(fireImmediately: true);
  }
}

@Riverpod(keepAlive: true)
Future<ReportRepository> reportRepository(ReportRepositoryRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  return ReportRepository(isar);
}
