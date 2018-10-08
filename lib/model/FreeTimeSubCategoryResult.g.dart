// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FreeTimeSubCategoryResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreeTimeSubCategoryResult _$FreeTimeSubCategoryResultFromJson(
    Map<String, dynamic> json) {
  return FreeTimeSubCategoryResult(
      json['error'] as bool,
      (json['results'] as List)
          ?.map((e) => e == null
              ? null
              : FreeTimeSubCategory.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$FreeTimeSubCategoryResultToJson(
        FreeTimeSubCategoryResult instance) =>
    <String, dynamic>{'error': instance.error, 'results': instance.results};
