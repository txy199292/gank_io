import 'package:json_annotation/json_annotation.dart';
import 'package:gank_io/model/FreeTimeSubCategory.dart';
part 'FreeTimeSubCategoryResult.g.dart';

@JsonSerializable()
class FreeTimeSubCategoryResult{
  bool error;
  List<FreeTimeSubCategory> results;

  FreeTimeSubCategoryResult(this.error, this.results);

  factory FreeTimeSubCategoryResult.fromJson(Map<String, dynamic> json) => _$FreeTimeSubCategoryResultFromJson(json);


  Map<String, dynamic> toJson() => _$FreeTimeSubCategoryResultToJson(this);
}