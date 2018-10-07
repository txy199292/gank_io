import 'package:json_annotation/json_annotation.dart';
import 'package:gank_io/model/FreeTimeCategory.dart';
part 'FreeTimeCategoryResult.g.dart';

@JsonSerializable()
class FreeTimeCategoryResult{
  bool error;
  List<FreeTimeCategory> results;

  FreeTimeCategoryResult(this.error, this.results);

  factory FreeTimeCategoryResult.fromJson(Map<String, dynamic> json) => _$FreeTimeCategoryResultFromJson(json);


  Map<String, dynamic> toJson() => _$FreeTimeCategoryResultToJson(this);
}