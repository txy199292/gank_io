import 'package:json_annotation/json_annotation.dart';
import 'package:gank_io/model/DailyNew.dart';
part 'HttpResult.g.dart';

@JsonSerializable()
class HttpResult {
  List<String> category;
  bool error;
  List<DailyNew> results;


  HttpResult(this.category, this.error, this.results);

  factory HttpResult.fromJson(Map<String, dynamic> json) => _$HttpResultFromJson(json);

}