import 'package:json_annotation/json_annotation.dart';
import 'package:gank_io/model/FreeTimeItem.dart';
part 'FreeTimeItemResult.g.dart';

@JsonSerializable()
class FreeTimeItemResult{
  bool error;
  List<FreeTimeItem> results;

  FreeTimeItemResult(this.error, this.results);

  factory FreeTimeItemResult.fromJson(Map<String, dynamic> json) => _$FreeTimeItemResultFromJson(json);


  Map<String, dynamic> toJson() => _$FreeTimeItemResultToJson(this);
}