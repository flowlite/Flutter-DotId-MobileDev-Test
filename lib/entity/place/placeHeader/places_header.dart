import 'package:json_annotation/json_annotation.dart';

part 'places_header.g.dart';

@JsonSerializable(explicitToJson: true, nullable: true, ignoreUnannotated: true)
class PlacesHeader {
  @JsonKey(name: "title") String? title;
  @JsonKey(name: "subtitle") String? subtitle;

  PlacesHeader({
    this.title,
    this.subtitle
  });

  /// Connect the generated [_$PlacesHeaderFromJson] function to the `fromJson`
  /// factory.
  factory PlacesHeader.fromJson(Map<String,dynamic> json) => _$PlacesHeaderFromJson(json);

  /// Connect the generated [_$PlacesHeaderToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PlacesHeaderToJson(this);
}