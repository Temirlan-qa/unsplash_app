import 'package:unsplash_app/logic/data/models/gallery_model.dart';
import 'package:dio/dio.dart';
class GalleryListProvider{
  Future<List<Photo>> fetchPhotos() async {
    final dio = Dio();
    // ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9 = $id future можно сделать так
    final response = await dio.get(
        'https://api.unsplash.com/photos/?client_id=ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9'
    );
    if (response.statusCode == 200) {
      List<dynamic> photosJson = response.data;
      return photosJson.map((photoJson) => Photo.fromJson(photoJson)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}

