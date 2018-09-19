// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HttpResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HttpResult _$HttpResultFromJson(Map<String, dynamic> json) {
  return HttpResult(
      (json['category'] as List)?.map((e) => e as String)?.toList(),
      json['error'] as bool,
      (json['results'] as List)
          ?.map((e) =>
              e == null ? null : DailyNew.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$HttpResultToJson(HttpResult instance) =>
    <String, dynamic>{
      'category': instance.category,
      'error': instance.error,
      'results': instance.results
    };
