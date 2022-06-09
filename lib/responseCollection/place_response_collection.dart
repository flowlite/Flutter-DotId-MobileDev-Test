import 'package:flutter_dotid_mobiledev_test/entity/place/placesResponseData/places_response_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_response_collection.g.dart';

@JsonSerializable(explicitToJson: true, nullable: true, ignoreUnannotated: true)
class PlacesResponseCollection {
  @JsonKey(name: "status_code") int? statusCode;
  @JsonKey(name: "message") String? message;
  @JsonKey(name: "data") PlacesResponseData? data;

  PlacesResponseCollection({
    this.statusCode,
    this.message,
    this.data,
  });

  /// Connect the generated [_$PlacesResponseCollectionFromJson] function to the `fromJson`
  /// factory.
  factory PlacesResponseCollection.fromJson(Map<String,dynamic> json) => _$PlacesResponseCollectionFromJson(json);

  /// Connect the generated [_$PlacesResponseCollectionToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PlacesResponseCollectionToJson(this);
}