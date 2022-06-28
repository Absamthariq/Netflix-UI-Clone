import 'package:json_annotation/json_annotation.dart';

  part 'comming.g.dart';

@JsonSerializable()
class DownloadModel {
  @JsonKey()
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: "poster_path")
  String? image;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'backdropImage')
  String? backdropImage;
   DownloadModel({
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.image,
    required this.backdropImage
  });
  // factory DownloadModel.fromJson(Map<String, dynamic> json) => _$DownloadModelFromJson(json);
  // Map<String,dynamic> toJson() => _$DownloadModelToJson(this);
}
