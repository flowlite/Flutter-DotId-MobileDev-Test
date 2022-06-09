// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesContent _$PlacesContentFromJson(Map<String, dynamic> json) =>
    PlacesContent(
      id: json['id'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      type: json['type'] as String?,
      image: json['image'] as String?,
      media:
          (json['media'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PlacesContentToJson(PlacesContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'type': instance.type,
      'image': instance.image,
      'media': instance.media,
    };
