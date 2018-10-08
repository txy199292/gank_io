// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FreeTimeItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreeTimeItem _$FreeTimeItemFromJson(Map<String, dynamic> json) {
  return FreeTimeItem(
      json['_id'] as String,
      json['content'] as String,
      json['cover'] as String,
      json['crawled'] as int,
      json['created_at'] as String,
      json['deleted'] as bool,
      json['published_at'] as String,
      json['raw'] as String,
      json['site'] == null
          ? null
          : FreeTimeSite.fromJson(json['site'] as Map<String, dynamic>),
      json['title'] as String,
      json['uid'] as String,
      json['url'] as String);
}

Map<String, dynamic> _$FreeTimeItemToJson(FreeTimeItem instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'content': instance.content,
      'cover': instance.cover,
      'crawled': instance.crawled,
      'created_at': instance.created_at,
      'deleted': instance.deleted,
      'published_at': instance.published_at,
      'raw': instance.raw,
      'site': instance.site,
      'title': instance.title,
      'uid': instance.uid,
      'url': instance.url
    };
