class CharacterEntity {
  final int id;
  final String name;
  final String image;
  final String status;
  final String species;
  final String location;
  final bool isFavorite;

  CharacterEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.species,
    required this.location,
    this.isFavorite = false,
  });
  CharacterEntity copyWith({
    int? id,
    String? name,
    String? image,
    String? status,
    String? species,
    String? location,
    bool? isFavorite,
  }) {
    return CharacterEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      status: status ?? this.status,
      species: species ?? this.species,
      location: location ?? this.location,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
