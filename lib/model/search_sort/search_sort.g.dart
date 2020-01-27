// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_sort.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSort _$SearchSortFromJson(Map<String, dynamic> json) {
  return SearchSort(
    direction:
        _$enumDecodeNullable(_$SearchSortDirectionEnumMap, json['direction']),
    field: json['field'] as String,
  );
}

Map<String, dynamic> _$SearchSortToJson(SearchSort instance) =>
    <String, dynamic>{
      'direction': _$SearchSortDirectionEnumMap[instance.direction],
      'field': instance.field,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$SearchSortDirectionEnumMap = {
  SearchSortDirection.ASC: 'ASC',
  SearchSortDirection.DESC: 'DESC',
};
