import 'package:flutter_dotid_mobiledev_test/entity/place/placeHeader/places_header.dart';
import 'package:flutter_dotid_mobiledev_test/entity/place/placesContent/places_content.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_response_data.g.dart';

@JsonSerializable(explicitToJson: true, nullable: true, ignoreUnannotated: true)
class PlacesResponseData {
  @JsonKey(name: "header") PlacesHeader? header;
  @JsonKey(name: "content") List<PlacesContent>? content;

  PlacesResponseData({
    this.header,
    this.content,
  });

  /// Connect the generated [_$PlacesResponseDataFromJson] function to the `fromJson`
  /// factory.
  factory PlacesResponseData.fromJson(Map<String,dynamic> json) => _$PlacesResponseDataFromJson(json);

  /// Connect the generated [_$PlacesResponseDataToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PlacesResponseDataToJson(this);
}