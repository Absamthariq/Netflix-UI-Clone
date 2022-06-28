// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comming.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownloadModel _$DownloadModelFromJson(Map<String, dynamic> json) =>
    DownloadModel(
      overview: json['overview'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
      image: json['poster_path'] as String?,
      backdropImage: json['backdropImage'] as String?,
    );

Map<String, dynamic> _$DownloadModelToJson(DownloadModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'overview': instance.overview,
      'poster_path': instance.image,
      'release_date': instance.releaseDate,
      'backdropImage': instance.backdropImage,
    };
