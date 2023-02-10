import 'package:flutter/material.dart';
import 'package:unsplash_app/presentation/home/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unsplash_app',
      home: GalleryScreen(),
    );
  }
}
