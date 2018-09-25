import 'package:gank_io/model/DailyNew.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Category.g.dart';

@JsonSerializable()
class Category {
  List<DailyNew> Android;
  List<DailyNew> App;
  List<DailyNew> iOS;
  @JsonKey(name: '休息视频')
  List<DailyNew> video;
  @JsonKey(name: '拓展资源')
  List<DailyNew> exRes;
  @JsonKey(name: '瞎推荐')
  List<DailyNew> recommend;
  @JsonKey(name: '福利')
  List<DailyNew> welfare;

  Category(this.Android, this.App, this.iOS, this.video, this.exRes,
      this.recommend, this.welfare);


  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
