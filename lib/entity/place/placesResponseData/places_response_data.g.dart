// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesResponseData _$PlacesResponseDataFromJson(Map<String, dynamic> json) =>
    PlacesResponseData(
      header: json['header'] == null
          ? null
          : PlacesHeader.fromJson(json['header'] as Map<String, dynamic>),
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => PlacesContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlacesResponseDataToJson(PlacesResponseData instance) =>
    <String, dynamic>{
      'header': instance.header?.toJson(),
      'content': instance.content?.map((e) => e.toJson()).toList(),
    };
