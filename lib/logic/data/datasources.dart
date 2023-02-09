import 'package:http/http.dart' as http;
import 'dart:async';

class GetApi{
  static Future getAlbums(){
    return http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));
  }
  static Future getPhotos(){
    return http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
  }
}