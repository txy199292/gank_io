// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FreeTimeSubCategory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreeTimeSubCategory _$FreeTimeSubCategoryFromJson(Map<String, dynamic> json) {
  return FreeTimeSubCategory(
      json['_id'] as String,
      json['created_at'] as String,
      json['icon'] as String,
      json['id'] as String,
      json['title'] as String);
}

Map<String, dynamic> _$FreeTimeSubCategoryToJson(
        FreeTimeSubCategory instance) =>
    <String, dynamic>{
      '_id': instance.cid,
      'created_at': instance.created_at,
      'icon': instance.icon,
      'id': instance.id,
      'title': instance.title
    };
