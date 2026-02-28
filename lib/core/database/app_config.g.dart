// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAppConfigCollection on Isar {
  IsarCollection<AppConfig> get appConfigs => this.collection();
}

const AppConfigSchema = CollectionSchema(
  name: r'AppConfig',
  id: -7085420701237142207,
  properties: {
    r'customCategories': PropertySchema(
      id: 0,
      name: r'customCategories',
      type: IsarType.stringList,
    ),
    r'lastReportViewedMonth': PropertySchema(
      id: 1,
      name: r'lastReportViewedMonth',
      type: IsarType.string,
    )
  },
  estimateSize: _appConfigEstimateSize,
  serialize: _appConfigSerialize,
  deserialize: _appConfigDeserialize,
  deserializeProp: _appConfigDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _appConfigGetId,
  getLinks: _appConfigGetLinks,
  attach: _appConfigAttach,
  version: '3.1.0+1',
);

int _appConfigEstimateSize(
  AppConfig object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.customCategories.length * 3;
  {
    for (var i = 0; i < object.customCategories.length; i++) {
      final value = object.customCategories[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.lastReportViewedMonth;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _appConfigSerialize(
  AppConfig object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.customCategories);
  writer.writeString(offsets[1], object.lastReportViewedMonth);
}

AppConfig _appConfigDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AppConfig();
  object.customCategories = reader.readStringList(offsets[0]) ?? [];
  object.id = id;
  object.lastReportViewedMonth = reader.readStringOrNull(offsets[1]);
  return object;
}

P _appConfigDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _appConfigGetId(AppConfig object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _appConfigGetLinks(AppConfig object) {
  return [];
}

void _appConfigAttach(IsarCollection<dynamic> col, Id id, AppConfig object) {
  object.id = id;
}

extension AppConfigQueryWhereSort
    on QueryBuilder<AppConfig, AppConfig, QWhere> {
  QueryBuilder<AppConfig, AppConfig, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AppConfigQueryWhere
    on QueryBuilder<AppConfig, AppConfig, QWhereClause> {
  QueryBuilder<AppConfig, AppConfig, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppConfigQueryFilter
    on QueryBuilder<AppConfig, AppConfig, QFilterCondition> {
  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      customCategoriesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      customCategoriesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      customCategoriesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      customCategoriesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customCategories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      customCategoriesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      customCategoriesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      customCategoriesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      customCategoriesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customCategories',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      customCategoriesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customCategories',
        value: '',
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      customCategoriesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customCategories',
        value: '',
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      customCategoriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customCategories',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      customCategoriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customCategories',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      customCategoriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customCategories',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      customCategoriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customCategories',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      customCategoriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customCategories',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      customCategoriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customCategories',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      lastReportViewedMonthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastReportViewedMonth',
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      lastReportViewedMonthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastReportViewedMonth',
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      lastReportViewedMonthEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastReportViewedMonth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      lastReportViewedMonthGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastReportViewedMonth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      lastReportViewedMonthLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastReportViewedMonth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      lastReportViewedMonthBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastReportViewedMonth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      lastReportViewedMonthStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastReportViewedMonth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      lastReportViewedMonthEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastReportViewedMonth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      lastReportViewedMonthContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastReportViewedMonth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      lastReportViewedMonthMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastReportViewedMonth',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      lastReportViewedMonthIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastReportViewedMonth',
        value: '',
      ));
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      lastReportViewedMonthIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastReportViewedMonth',
        value: '',
      ));
    });
  }
}

extension AppConfigQueryObject
    on QueryBuilder<AppConfig, AppConfig, QFilterCondition> {}

extension AppConfigQueryLinks
    on QueryBuilder<AppConfig, AppConfig, QFilterCondition> {}

extension AppConfigQuerySortBy on QueryBuilder<AppConfig, AppConfig, QSortBy> {
  QueryBuilder<AppConfig, AppConfig, QAfterSortBy>
      sortByLastReportViewedMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReportViewedMonth', Sort.asc);
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterSortBy>
      sortByLastReportViewedMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReportViewedMonth', Sort.desc);
    });
  }
}

extension AppConfigQuerySortThenBy
    on QueryBuilder<AppConfig, AppConfig, QSortThenBy> {
  QueryBuilder<AppConfig, AppConfig, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterSortBy>
      thenByLastReportViewedMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReportViewedMonth', Sort.asc);
    });
  }

  QueryBuilder<AppConfig, AppConfig, QAfterSortBy>
      thenByLastReportViewedMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReportViewedMonth', Sort.desc);
    });
  }
}

extension AppConfigQueryWhereDistinct
    on QueryBuilder<AppConfig, AppConfig, QDistinct> {
  QueryBuilder<AppConfig, AppConfig, QDistinct> distinctByCustomCategories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customCategories');
    });
  }

  QueryBuilder<AppConfig, AppConfig, QDistinct> distinctByLastReportViewedMonth(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastReportViewedMonth',
          caseSensitive: caseSensitive);
    });
  }
}

extension AppConfigQueryProperty
    on QueryBuilder<AppConfig, AppConfig, QQueryProperty> {
  QueryBuilder<AppConfig, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AppConfig, List<String>, QQueryOperations>
      customCategoriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customCategories');
    });
  }

  QueryBuilder<AppConfig, String?, QQueryOperations>
      lastReportViewedMonthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastReportViewedMonth');
    });
  }
}
