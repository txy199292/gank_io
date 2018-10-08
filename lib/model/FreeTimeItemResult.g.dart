// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FreeTimeItemResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreeTimeItemResult _$FreeTimeItemResultFromJson(Map<String, dynamic> json) {
  return FreeTimeItemResult(
      json['error'] as bool,
      (json['results'] as List)
          ?.map((e) => e == null
              ? null
              : FreeTimeItem.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$FreeTimeItemResultToJson(FreeTimeItemResult instance) =>
    <String, dynamic>{'error': instance.error, 'results': instance.results};
