// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      overview: json['overview'] as String?,
      releasedate: json['release_date'] as String?,
      title: json['title'] as String?,
      image: json['poster_path'] as String?,
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'overview': instance.overview,
      'release_date': instance.releasedate,
      'title': instance.title,
      'poster_path': instance.image,
    };
