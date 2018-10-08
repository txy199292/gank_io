import 'package:json_annotation/json_annotation.dart';
part 'FreeTimeSubCategory.g.dart';

@JsonSerializable()
class FreeTimeSubCategory{
  @JsonKey(name: '_id')
  String cid;
  String created_at;
  String icon;
  String id;
  String title;


  FreeTimeSubCategory(this.cid, this.created_at, this.icon, this.id, this.title);

  factory FreeTimeSubCategory.fromJson(Map<String, dynamic> json) => _$FreeTimeSubCategoryFromJson(json);


  Map<String, dynamic> toJson() => _$FreeTimeSubCategoryToJson(this);

}