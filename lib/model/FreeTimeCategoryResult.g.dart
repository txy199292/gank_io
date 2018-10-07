// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FreeTimeCategoryResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreeTimeCategoryResult _$FreeTimeCategoryResultFromJson(
    Map<String, dynamic> json) {
  return FreeTimeCategoryResult(
      json['error'] as bool,
      (json['results'] as List)
          ?.map((e) => e == null
              ? null
              : FreeTimeCategory.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$FreeTimeCategoryResultToJson(
        FreeTimeCategoryResult instance) =>
    <String, dynamic>{'error': instance.error, 'results': instance.results};
