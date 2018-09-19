import 'package:json_annotation/json_annotation.dart';
part 'DailyNew.g.dart';

@JsonSerializable()
class DailyNew {
  @JsonKey(name: '_id')
  String id;
  String createdAt;
  String desc;
  List<String> images;
  String publishedAt;
  String source;
  String type;
  String url;
  bool used;
  String who;

  DailyNew(this.id, this.createdAt, this.desc, this.images, this.publishedAt,
      this.source, this.type, this.url, this.used, this.who);

  factory DailyNew.fromJson(Map<String, dynamic> json) => _$DailyNewFromJson(json);

}