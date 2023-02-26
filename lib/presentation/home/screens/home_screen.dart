import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_app/logic/data/models/gallery_model.dart';
import 'package:unsplash_app/logic/data/services_api_provider.dart';
import 'package:unsplash_app/presentation/home/widgets/list_widget.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late Future<List<Photo>> photos;

  @override
  void initState() {
    super.initState();
    photos = GalleryListProvider().fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gallery App',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder<List<Photo>>(
        future: photos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final photos = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ListPhotoWidget(photos: photos),
            );
          }
          else if (snapshot.hasError) {
            if (kDebugMode) {
              print(snapshot.error);
            }
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
