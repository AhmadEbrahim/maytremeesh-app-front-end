class Venue {
  final int id;
  final String name;
  final String logoPath;
  const Venue({
    required this.id,
    required this.name,
    required this.logoPath,
  });

  factory Venue.fromJson(Map<String, dynamic> json) {
    return new Venue(
      id: json['id'],
      name: json['name'],
      logoPath: json['image'],
    );
  }
}
