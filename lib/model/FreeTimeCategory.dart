import 'package:json_annotation/json_annotation.dart';
part 'FreeTimeCategory.g.dart';

@JsonSerializable()
class FreeTimeCategory{
  @JsonKey(name: '_id')
  String id;
  String en_name;
  String name;
  int rank;


  FreeTimeCategory(this.id, this.en_name, this.name, this.rank);

  factory FreeTimeCategory.fromJson(Map<String, dynamic> json) => _$FreeTimeCategoryFromJson(json);


  Map<String, dynamic> toJson() => _$FreeTimeCategoryToJson(this);

}