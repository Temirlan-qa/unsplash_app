import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListPhotoWidget extends StatelessWidget {
  final List list;
  const ListPhotoWidget({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(
              height: 12,
            ),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              CachedNetworkImage(
                placeholder: (context, url) =>
                    const CircleAvatar(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                // placeholder: (context, url) => Image.asset("assets/img/placeholder.png",),
                imageUrl: 'https://picsum.photos/250?image=15',
                width: MediaQuery.of(context).size.width - 32,
                height: 102,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "123",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Text(
                      list[index].title,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
