import 'package:json_annotation/json_annotation.dart';

part 'places_content.g.dart';

@JsonSerializable(explicitToJson: true, nullable: true, ignoreUnannotated: true)
class PlacesContent {
  @JsonKey(name: "id") int? id;
  @JsonKey(name: "title") String? title;
  @JsonKey(name: "content") String? content;
  @JsonKey(name: "type") String? type;
  @JsonKey(name: "image") String? image;
  @JsonKey(name: "media") List<String>? media;

  PlacesContent({
    this.id,
    this.title,
    this.content,
    this.type,
    this.image,
    this.media,
  });

  /// Connect the generated [_$PlacesContentFromJson] function to the `fromJson`
  /// factory.
  factory PlacesContent.fromJson(Map<String,dynamic> json) => _$PlacesContentFromJson(json);

  /// Connect the generated [_$PlacesContentToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PlacesContentToJson(this);
}