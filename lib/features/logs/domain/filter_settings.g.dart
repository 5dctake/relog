// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_settings.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFilterSettingsCollection on Isar {
  IsarCollection<FilterSettings> get filterSettings => this.collection();
}

const FilterSettingsSchema = CollectionSchema(
  name: r'FilterSettings',
  id: -3473006497142041201,
  properties: {
    r'categories': PropertySchema(
      id: 0,
      name: r'categories',
      type: IsarType.stringList,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'endDate': PropertySchema(
      id: 2,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'hasPhoto': PropertySchema(
      id: 3,
      name: r'hasPhoto',
      type: IsarType.bool,
    ),
    r'keyword': PropertySchema(
      id: 4,
      name: r'keyword',
      type: IsarType.string,
    ),
    r'maxCost': PropertySchema(
      id: 5,
      name: r'maxCost',
      type: IsarType.double,
    ),
    r'maxRating': PropertySchema(
      id: 6,
      name: r'maxRating',
      type: IsarType.double,
    ),
    r'minCost': PropertySchema(
      id: 7,
      name: r'minCost',
      type: IsarType.double,
    ),
    r'minRating': PropertySchema(
      id: 8,
      name: r'minRating',
      type: IsarType.double,
    ),
    r'moods': PropertySchema(
      id: 9,
      name: r'moods',
      type: IsarType.byteList,
      enumMap: _FilterSettingsmoodsEnumValueMap,
    ),
    r'name': PropertySchema(
      id: 10,
      name: r'name',
      type: IsarType.string,
    ),
    r'startDate': PropertySchema(
      id: 11,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'tags': PropertySchema(
      id: 12,
      name: r'tags',
      type: IsarType.stringList,
    )
  },
  estimateSize: _filterSettingsEstimateSize,
  serialize: _filterSettingsSerialize,
  deserialize: _filterSettingsDeserialize,
  deserializeProp: _filterSettingsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _filterSettingsGetId,
  getLinks: _filterSettingsGetLinks,
  attach: _filterSettingsAttach,
  version: '3.1.0+1',
);

int _filterSettingsEstimateSize(
  FilterSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.categories.length * 3;
  {
    for (var i = 0; i < object.categories.length; i++) {
      final value = object.categories[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.keyword;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.moods.length;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.tags.length * 3;
  {
    for (var i = 0; i < object.tags.length; i++) {
      final value = object.tags[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _filterSettingsSerialize(
  FilterSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.categories);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeDateTime(offsets[2], object.endDate);
  writer.writeBool(offsets[3], object.hasPhoto);
  writer.writeString(offsets[4], object.keyword);
  writer.writeDouble(offsets[5], object.maxCost);
  writer.writeDouble(offsets[6], object.maxRating);
  writer.writeDouble(offsets[7], object.minCost);
  writer.writeDouble(offsets[8], object.minRating);
  writer.writeByteList(offsets[9], object.moods.map((e) => e.index).toList());
  writer.writeString(offsets[10], object.name);
  writer.writeDateTime(offsets[11], object.startDate);
  writer.writeStringList(offsets[12], object.tags);
}

FilterSettings _filterSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FilterSettings();
  object.categories = reader.readStringList(offsets[0]) ?? [];
  object.createdAt = reader.readDateTime(offsets[1]);
  object.endDate = reader.readDateTimeOrNull(offsets[2]);
  object.hasPhoto = reader.readBoolOrNull(offsets[3]);
  object.id = id;
  object.keyword = reader.readStringOrNull(offsets[4]);
  object.maxCost = reader.readDoubleOrNull(offsets[5]);
  object.maxRating = reader.readDoubleOrNull(offsets[6]);
  object.minCost = reader.readDoubleOrNull(offsets[7]);
  object.minRating = reader.readDoubleOrNull(offsets[8]);
  object.moods = reader
          .readByteList(offsets[9])
          ?.map((e) => _FilterSettingsmoodsValueEnumMap[e] ?? Mood.joy)
          .toList() ??
      [];
  object.name = reader.readString(offsets[10]);
  object.startDate = reader.readDateTimeOrNull(offsets[11]);
  object.tags = reader.readStringList(offsets[12]) ?? [];
  return object;
}

P _filterSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader
              .readByteList(offset)
              ?.map((e) => _FilterSettingsmoodsValueEnumMap[e] ?? Mood.joy)
              .toList() ??
          []) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _FilterSettingsmoodsEnumValueMap = {
  'joy': 0,
  'anger': 1,
  'sorrow': 2,
  'fun': 3,
  'nothing': 4,
};
const _FilterSettingsmoodsValueEnumMap = {
  0: Mood.joy,
  1: Mood.anger,
  2: Mood.sorrow,
  3: Mood.fun,
  4: Mood.nothing,
};

Id _filterSettingsGetId(FilterSettings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _filterSettingsGetLinks(FilterSettings object) {
  return [];
}

void _filterSettingsAttach(
    IsarCollection<dynamic> col, Id id, FilterSettings object) {
  object.id = id;
}

extension FilterSettingsQueryWhereSort
    on QueryBuilder<FilterSettings, FilterSettings, QWhere> {
  QueryBuilder<FilterSettings, FilterSettings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FilterSettingsQueryWhere
    on QueryBuilder<FilterSettings, FilterSettings, QWhereClause> {
  QueryBuilder<FilterSettings, FilterSettings, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<FilterSettings, FilterSettings, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterWhereClause> idBetween(
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

extension FilterSettingsQueryFilter
    on QueryBuilder<FilterSettings, FilterSettings, QFilterCondition> {
  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      categoriesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      categoriesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      categoriesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      categoriesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      categoriesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      categoriesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      categoriesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      categoriesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categories',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      categoriesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categories',
        value: '',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      categoriesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categories',
        value: '',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      categoriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      categoriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      categoriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      categoriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      categoriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      categoriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      endDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      endDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      endDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      endDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      endDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      endDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      hasPhotoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hasPhoto',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      hasPhotoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hasPhoto',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      hasPhotoEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasPhoto',
        value: value,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      keywordIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'keyword',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      keywordIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'keyword',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      keywordEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      keywordGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      keywordLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      keywordBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'keyword',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      keywordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      keywordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      keywordContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      keywordMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'keyword',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      keywordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keyword',
        value: '',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      keywordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'keyword',
        value: '',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      maxCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxCost',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      maxCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxCost',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      maxCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      maxCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      maxCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      maxCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      maxRatingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxRating',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      maxRatingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxRating',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      maxRatingEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxRating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      maxRatingGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxRating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      maxRatingLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxRating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      maxRatingBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxRating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      minCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minCost',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      minCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minCost',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      minCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      minCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      minCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      minCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      minRatingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minRating',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      minRatingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minRating',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      minRatingEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minRating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      minRatingGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minRating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      minRatingLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minRating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      minRatingBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minRating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      moodsElementEqualTo(Mood value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'moods',
        value: value,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      moodsElementGreaterThan(
    Mood value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'moods',
        value: value,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      moodsElementLessThan(
    Mood value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'moods',
        value: value,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      moodsElementBetween(
    Mood lower,
    Mood upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'moods',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      moodsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moods',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      moodsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moods',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      moodsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moods',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      moodsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moods',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      moodsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moods',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      moodsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moods',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      startDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      startDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      startDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      startDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      startDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      startDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      tagsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterFilterCondition>
      tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension FilterSettingsQueryObject
    on QueryBuilder<FilterSettings, FilterSettings, QFilterCondition> {}

extension FilterSettingsQueryLinks
    on QueryBuilder<FilterSettings, FilterSettings, QFilterCondition> {}

extension FilterSettingsQuerySortBy
    on QueryBuilder<FilterSettings, FilterSettings, QSortBy> {
  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy>
      sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> sortByHasPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasPhoto', Sort.asc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy>
      sortByHasPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasPhoto', Sort.desc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> sortByKeyword() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyword', Sort.asc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy>
      sortByKeywordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyword', Sort.desc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> sortByMaxCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxCost', Sort.asc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy>
      sortByMaxCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxCost', Sort.desc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> sortByMaxRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRating', Sort.asc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy>
      sortByMaxRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRating', Sort.desc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> sortByMinCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minCost', Sort.asc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy>
      sortByMinCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minCost', Sort.desc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> sortByMinRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRating', Sort.asc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy>
      sortByMinRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRating', Sort.desc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy>
      sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }
}

extension FilterSettingsQuerySortThenBy
    on QueryBuilder<FilterSettings, FilterSettings, QSortThenBy> {
  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy>
      thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> thenByHasPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasPhoto', Sort.asc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy>
      thenByHasPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasPhoto', Sort.desc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> thenByKeyword() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyword', Sort.asc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy>
      thenByKeywordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyword', Sort.desc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> thenByMaxCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxCost', Sort.asc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy>
      thenByMaxCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxCost', Sort.desc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> thenByMaxRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRating', Sort.asc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy>
      thenByMaxRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRating', Sort.desc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> thenByMinCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minCost', Sort.asc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy>
      thenByMinCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minCost', Sort.desc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> thenByMinRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRating', Sort.asc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy>
      thenByMinRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRating', Sort.desc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy> thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QAfterSortBy>
      thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }
}

extension FilterSettingsQueryWhereDistinct
    on QueryBuilder<FilterSettings, FilterSettings, QDistinct> {
  QueryBuilder<FilterSettings, FilterSettings, QDistinct>
      distinctByCategories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categories');
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QDistinct> distinctByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate');
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QDistinct> distinctByHasPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasPhoto');
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QDistinct> distinctByKeyword(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'keyword', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QDistinct> distinctByMaxCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxCost');
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QDistinct>
      distinctByMaxRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxRating');
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QDistinct> distinctByMinCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minCost');
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QDistinct>
      distinctByMinRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minRating');
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QDistinct> distinctByMoods() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'moods');
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QDistinct>
      distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<FilterSettings, FilterSettings, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }
}

extension FilterSettingsQueryProperty
    on QueryBuilder<FilterSettings, FilterSettings, QQueryProperty> {
  QueryBuilder<FilterSettings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FilterSettings, List<String>, QQueryOperations>
      categoriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categories');
    });
  }

  QueryBuilder<FilterSettings, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<FilterSettings, DateTime?, QQueryOperations> endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<FilterSettings, bool?, QQueryOperations> hasPhotoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasPhoto');
    });
  }

  QueryBuilder<FilterSettings, String?, QQueryOperations> keywordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'keyword');
    });
  }

  QueryBuilder<FilterSettings, double?, QQueryOperations> maxCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxCost');
    });
  }

  QueryBuilder<FilterSettings, double?, QQueryOperations> maxRatingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxRating');
    });
  }

  QueryBuilder<FilterSettings, double?, QQueryOperations> minCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minCost');
    });
  }

  QueryBuilder<FilterSettings, double?, QQueryOperations> minRatingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minRating');
    });
  }

  QueryBuilder<FilterSettings, List<Mood>, QQueryOperations> moodsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moods');
    });
  }

  QueryBuilder<FilterSettings, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<FilterSettings, DateTime?, QQueryOperations>
      startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<FilterSettings, List<String>, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }
}
