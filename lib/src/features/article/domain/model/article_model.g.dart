// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Article _$$_ArticleFromJson(Map<String, dynamic> json) => _$_Article(
      name: json['name'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? "",
      isForFree: json['isForFree'] as bool? ?? false,
      imagePath: json['imagePath'] as String? ?? "",
    );

Map<String, dynamic> _$$_ArticleToJson(_$_Article instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'description': instance.description,
      'isForFree': instance.isForFree,
      'imagePath': instance.imagePath,
    };
