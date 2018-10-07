import 'package:json_annotation/json_annotation.dart';
import 'package:gank_io/model/Post.dart';
part 'WelfareResult.g.dart';

@JsonSerializable()
class WelfareResult {
  bool error;
  List<Post> results;


  WelfareResult({ this.error, this.results});

  factory WelfareResult.fromJson(Map<String, dynamic> json) => _$WelfareResultFromJson(json);


  Map<String, dynamic> toJson() => _$WelfareResultToJson(this);
}