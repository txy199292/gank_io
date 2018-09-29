// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WelfareResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WelfareResult _$WelfareResultFromJson(Map<String, dynamic> json) {
  return WelfareResult(
      error: json['error'] as bool,
      results: (json['results'] as List)
          ?.map((e) =>
              e == null ? null : Post.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$WelfareResultToJson(WelfareResult instance) =>
    <String, dynamic>{'error': instance.error, 'results': instance.results};
