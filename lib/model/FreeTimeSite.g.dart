// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FreeTimeSite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreeTimeSite _$FreeTimeSiteFromJson(Map<String, dynamic> json) {
  return FreeTimeSite(
      json['cat_cn'] as String,
      json['cat_en'] as String,
      json['desc'] as String,
      json['feed_id'] as String,
      json['icon'] as String,
      json['id'] as String,
      json['name'] as String,
      json['subscribers'] as int,
      json['type'] as String,
      json['url'] as String);
}

Map<String, dynamic> _$FreeTimeSiteToJson(FreeTimeSite instance) =>
    <String, dynamic>{
      'cat_cn': instance.cat_cn,
      'cat_en': instance.cat_en,
      'desc': instance.desc,
      'feed_id': instance.feed_id,
      'icon': instance.icon,
      'id': instance.id,
      'name': instance.name,
      'subscribers': instance.subscribers,
      'type': instance.type,
      'url': instance.url
    };
