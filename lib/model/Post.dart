import 'package:json_annotation/json_annotation.dart';
part 'Post.g.dart';

@JsonSerializable()
class Post{
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

  Post({this.id, this.createdAt, this.desc, this.images, this.publishedAt,
      this.source, this.type, this.url, this.used, this.who});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);


  Map<String, dynamic> toJson() => _$PostToJson(this);

}