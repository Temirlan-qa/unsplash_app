import 'package:unsplash_app/logic/data/models/gallery_model.dart';
import 'package:unsplash_app/logic/data/services_api_provider.dart';
class GalleryListRepository {
  final GalleryListProvider _GalleryListProvider = GalleryListProvider();
  Future<List<Photo>> getAllGalleryList() => _GalleryListProvider.fetchPhotos();
}