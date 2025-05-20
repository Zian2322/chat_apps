import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class PixelformImage {
  String id;
  String author;
  String url;

  @JsonKey(name: 'url_full_size')
  String urlFullSize;

  PixelformImage(
      {required this.author,
        required this.url,
        required this.id,
        required this.urlFullSize});

  factory PixelformImage.fromJson(Map<String, dynamic> json) =>
      _$PixelformImageFromJson(json);

  Map<String, dynamic> toJson() => _$PixelformImageToJson(this);
}