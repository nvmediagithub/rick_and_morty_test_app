import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String image;
  final LocationModel location;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.image,
    required this.location,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}

@JsonSerializable()
class LocationModel {
  final String name;
  final String url;

  LocationModel({required this.name, required this.url});

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
