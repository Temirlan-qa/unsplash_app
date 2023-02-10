import 'package:flutter/material.dart';
import 'package:unsplash_app/logic/data/models/gallery_model.dart';

class PhotoScreen extends StatelessWidget {
  final Photo photo;

  const PhotoScreen({Key? key,required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Hero(
          tag: photo.id,
          child: Image.network(
            photo.full,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}