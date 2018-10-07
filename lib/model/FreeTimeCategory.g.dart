// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FreeTimeCategory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreeTimeCategory _$FreeTimeCategoryFromJson(Map<String, dynamic> json) {
  return FreeTimeCategory(json['_id'] as String, json['en_name'] as String,
      json['name'] as String, json['rank'] as int);
}

Map<String, dynamic> _$FreeTimeCategoryToJson(FreeTimeCategory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'en_name': instance.en_name,
      'name': instance.name,
      'rank': instance.rank
    };
