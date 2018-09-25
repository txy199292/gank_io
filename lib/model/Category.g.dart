// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
      (json['Android'] as List)
          ?.map((e) =>
              e == null ? null : DailyNew.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['App'] as List)
          ?.map((e) =>
              e == null ? null : DailyNew.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['iOS'] as List)
          ?.map((e) =>
              e == null ? null : DailyNew.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['休息视频'] as List)
          ?.map((e) =>
              e == null ? null : DailyNew.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['拓展资源'] as List)
          ?.map((e) =>
              e == null ? null : DailyNew.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['瞎推荐'] as List)
          ?.map((e) =>
              e == null ? null : DailyNew.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['福利'] as List)
          ?.map((e) =>
              e == null ? null : DailyNew.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'Android': instance.Android,
      'App': instance.App,
      'iOS': instance.iOS,
      '休息视频': instance.video,
      '拓展资源': instance.exRes,
      '瞎推荐': instance.recommend,
      '福利': instance.welfare
    };
