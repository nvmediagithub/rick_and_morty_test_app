// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      image: json['image'] as String,
      location: LocationModel.fromJson(
        json['location'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'image': instance.image,
      'location': instance.location,
    };

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(name: json['name'] as String, url: json['url'] as String);

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};
