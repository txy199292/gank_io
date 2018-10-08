import 'package:json_annotation/json_annotation.dart';
import 'FreeTimeSite.dart';
part 'FreeTimeItem.g.dart';

@JsonSerializable()
class FreeTimeItem{
  @JsonKey(name: '_id')
  String id;
  String content;
  String cover;
  int crawled;
  String created_at;
  bool deleted;
  String published_at;
  String raw;
  FreeTimeSite site;
  String title;
  String uid;
  String url;

  FreeTimeItem(this.id, this.content, this.cover, this.crawled, this.created_at,
      this.deleted, this.published_at, this.raw, this.site, this.title,
      this.uid, this.url);

  factory FreeTimeItem.fromJson(Map<String, dynamic> json) => _$FreeTimeItemFromJson(json);


  Map<String, dynamic> toJson() => _$FreeTimeItemToJson(this);


}

