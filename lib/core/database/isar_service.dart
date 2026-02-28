import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/logs/domain/filter_settings.dart';
import '../../features/logs/domain/log_entry.dart';
import '../../features/report/domain/monthly_report.dart';

import '../../core/database/app_config.dart';

part 'isar_service.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isar(IsarRef ref) async {
  final dir = await getApplicationDocumentsDirectory();
  // すでに開いているインスタンスがあればそれを返す（ホットリスタート対策等）
  final existing = Isar.getInstance();
  if (existing != null) return existing;

  return Isar.open(
    [
      LogEntrySchema,
      FilterSettingsSchema,
      MonthlyReportSchema,
      AppConfigSchema,
    ],
    directory: dir.path,
  );
}
