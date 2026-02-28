import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/database/isar_service.dart';
import 'app_config.dart';

part 'app_config_repository.g.dart';

class AppConfigRepository {
  final Isar _isar;

  AppConfigRepository(this._isar);

  Future<AppConfig> getConfig() async {
    final config = await _isar.appConfigs.where().findFirst();
    if (config != null) return config;

    // 初期設定がない場合は作成
    final newConfig = AppConfig();
    await _isar.writeTxn(() async {
      await _isar.appConfigs.put(newConfig);
    });
    return newConfig;
  }

  Future<void> updateLastReportViewedMonth(String monthStr) async {
    final config = await getConfig();
    config.lastReportViewedMonth = monthStr;
    await _isar.writeTxn(() async {
      await _isar.appConfigs.put(config);
    });
  }

  Future<void> updateCustomCategories(List<String> categories) async {
    final config = await getConfig();
    config.customCategories = categories;
    await _isar.writeTxn(() async {
      await _isar.appConfigs.put(config);
    });
  }
}

@Riverpod(keepAlive: true)
Future<AppConfigRepository> appConfigRepository(AppConfigRepositoryRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  return AppConfigRepository(isar);
}
