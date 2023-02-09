class Photo {
  final String id;
  final String urls;
  final String description;
  final String author;

  Photo({required this.id,required this.urls,required this.description,required this.author});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      urls: json['urls']['thumb'],
      description: json['description'] ?? '',
      author: json['user']['name'],
    );
  }
}
