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
}
