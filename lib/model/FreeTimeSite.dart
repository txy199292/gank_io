import 'package:json_annotation/json_annotation.dart';
part 'FreeTimeSite.g.dart';

@JsonSerializable()
class FreeTimeSite{
  String cat_cn;
  String cat_en;
  String desc;
  String feed_id;
  String icon;
  String id;
  String name;
  int subscribers;
  String type;
  String url;

  FreeTimeSite(this.cat_cn, this.cat_en, this.desc, this.feed_id, this.icon,
      this.id, this.name, this.subscribers, this.type, this.url);

  factory FreeTimeSite.fromJson(Map<String, dynamic> json) => _$FreeTimeSiteFromJson(json);


  Map<String, dynamic> toJson() => _$FreeTimeSiteToJson(this);


}