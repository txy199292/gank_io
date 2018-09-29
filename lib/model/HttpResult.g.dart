// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HttpResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HttpResult _$HttpResultFromJson(Map<String, dynamic> json) {
  return HttpResult(
      category: (json['category'] as List)?.map((e) => e as String)?.toList(),
      error: json['error'] as bool,
      results: (json['results'] as Map<String, dynamic>)?.map((k, e) =>
          MapEntry(
              k,
              (e as List)
                  ?.map((e) => e == null
                      ? null
                      : Post.fromJson(e as Map<String, dynamic>))
                  ?.toList())));
}

Map<String, dynamic> _$HttpResultToJson(HttpResult instance) =>
    <String, dynamic>{
      'category': instance.category,
      'error': instance.error,
      'results': instance.results
    };
