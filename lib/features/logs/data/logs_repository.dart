import 'dart:convert';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/database/isar_service.dart';
import '../domain/log_entry.dart';

part 'logs_repository.g.dart';

class LogsRepository {
  final Isar _isar;

  LogsRepository(this._isar);

  /// ログを保存または更新する
  Future<void> saveLog(LogEntry log) async {
    await _isar.writeTxn(() async {
      await _isar.logEntrys.put(log);
    });
  }

  /// 全ログを JSON 文字列としてエクスポートする
  Future<String> exportToJson() async {
    // 常にソート可能な状態（QAfterFilterCondition）にするためのダミーフィルタを使用
    final logs = await _isar.logEntrys.filter().idGreaterThan(-1).sortByDateDesc().findAll();
    final jsonList = logs.map((l) => l.toJson()).toList();
    return jsonEncode(jsonList);
  }

  /// JSON 文字列からログをインポートする
  Future<void> importFromJson(String jsonStr) async {
    final List<dynamic> jsonList = jsonDecode(jsonStr);
    final logs = jsonList.map((j) => LogEntry.fromJson(j as Map<String, dynamic>)).toList();
    
    await _isar.writeTxn(() async {
      // 重複チェックは簡易的に ID を無視して全件追加とする
      await _isar.logEntrys.putAll(logs);
    });
  }

  /// ログを削除する
  Future<void> deleteLog(Id id) async {
    await _isar.writeTxn(() async {
      await _isar.logEntrys.delete(id);
    });
  }

  /// IDでログを取得する
  Future<LogEntry?> getLog(Id id) async {
    return _isar.logEntrys.get(id);
  }

  /// 全てのログを基準に従って監視する
  Stream<List<LogEntry>> watchLogs({
    bool dateDesc = true,
    bool ratingDesc = true,
    bool sortByRating = false,
    String? category,
    Mood? mood,
    double? minRating,
    int? year,
    int? month,
    String? searchQuery,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    // dynamic を使用すると拡張メソッド (sortBy...) が名前解決できず NoSuchMethodError になるため
    // 明示的な型指定（または型推論可能な var）を使用する
    QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> query = 
        _isar.logEntrys.filter().idGreaterThan(-1);
    
    if (category != null) {
      query = query.categoriesElementEqualTo(category);
    }
    
    if (mood != null) {
      query = query.and().moodEqualTo(mood);
    }

    if (minRating != null) {
      query = query.and().ratingGreaterThan(minRating - 0.01);
    }

    // 期間フィルタの適用
    if (startDate != null && endDate != null) {
      // 終了日の23:59:59まで含めるように調整
      final end = DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59);
      query = query.and().dateBetween(startDate, end);
    } else if (year != null && month != null && (searchQuery == null || searchQuery.isEmpty)) {
      // 検索ワードがない場合のみ当月フィルタを適用（検索はデフォルトで全期間）
      final start = DateTime(year, month);
      final end = DateTime(year, month + 1).subtract(const Duration(milliseconds: 1));
      query = query.and().dateBetween(start, end);
    }

    if (searchQuery != null && searchQuery.isNotEmpty) {
      query = query.and().group((q) => 
        q.titleContains(searchQuery, caseSensitive: false)
         .or()
         .noteContains(searchQuery, caseSensitive: false)
      );
    }

    if (sortByRating) {
      return ratingDesc 
        ? query.sortByRatingDesc().watch(fireImmediately: true)
        : query.sortByRating().watch(fireImmediately: true);
    } else {
      return dateDesc 
        ? query.sortByDateDesc().watch(fireImmediately: true)
        : query.sortByDate().watch(fireImmediately: true);
    }
  }
}

@Riverpod(keepAlive: true)
Future<LogsRepository> logsRepository(LogsRepositoryRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  return LogsRepository(isar);
}
