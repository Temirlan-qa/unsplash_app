import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unsplash_app/logic/data/models/gallery_model.dart';
class GalleryListProvider{
  Future<List<Photo>> fetchPhotos() async {
    final response = await http.get(Uri.parse(
        'https://api.unsplash.com/photos/?client_id=ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9'));
    if (response.statusCode == 200) {
      List<dynamic> photosJson = json.decode(response.body);
      return photosJson.map((photoJson) => Photo.fromJson(photoJson)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}

