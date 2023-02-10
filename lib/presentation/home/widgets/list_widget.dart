import 'package:flutter/material.dart';
import 'package:unsplash_app/presentation/photo/screens/photo_screen.dart';

class ListPhotoWidget extends StatelessWidget {
  final photos;
  const ListPhotoWidget({
    Key? key,
    this.photos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(
        height: 8,
      ),
      itemCount: photos!.length,
      itemBuilder: (context, index) {
        final photo = photos[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhotoScreen(photo: photo),
              ),
            );
          },
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  photo.urls,
                  fit: BoxFit.cover,
                  height: 102,
                  width: MediaQuery.of(context).size.width - 32,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        photo.author,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        photo.description,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
