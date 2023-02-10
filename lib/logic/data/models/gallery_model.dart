class Photo {
  final String id;
  final String urls;
  final String full;
  final String description;
  final String author;

  Photo({required this.id,required this.urls,required this.description,required this.author, required this.full});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      full: json['urls']['full'],
      urls: json['urls']['thumb'],
      description: json['alt_description'] ?? '',
      author: json['user']['name'],
    );
  }
}
