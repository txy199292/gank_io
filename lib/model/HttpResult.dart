import 'package:json_annotation/json_annotation.dart';
import 'package:gank_io/model/Post.dart';
part 'HttpResult.g.dart';

@JsonSerializable()
class HttpResult {
  List<String> category;
  bool error;
  Map<String,List<Post>> results;


  HttpResult({this.category, this.error, this.results});

  factory HttpResult.fromJson(Map<String, dynamic> json) => _$HttpResultFromJson(json);


  Map<String, dynamic> toJson() => _$HttpResultToJson(this);
}