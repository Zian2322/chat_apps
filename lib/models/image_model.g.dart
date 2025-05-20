// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixelformImage _$PixelformImageFromJson(Map<String, dynamic> json) =>
    PixelformImage(
      author: json['author'] as String,
      url: json['url'] as String,
      id: json['id'] as String,
      urlFullSize: json['url_full_size'] as String,
    );

Map<String, dynamic> _$PixelformImageToJson(PixelformImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'url': instance.url,
      'url_full_size': instance.urlFullSize,
    };
