// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_response_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesResponseCollection _$PlacesResponseCollectionFromJson(
        Map<String, dynamic> json) =>
    PlacesResponseCollection(
      statusCode: json['status_code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : PlacesResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlacesResponseCollectionToJson(
        PlacesResponseCollection instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };
