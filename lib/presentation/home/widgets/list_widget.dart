import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListPhotoWidget extends StatelessWidget {
  const ListPhotoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(
              height: 12,
            ),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return CachedNetworkImage(
            placeholder: (context, url) => CircleAvatar(child: const CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            // placeholder: (context, url) => Image.asset("assets/img/placeholder.png",),
            imageUrl: 'https://picsum.photos/250?image=12',
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
          );
        });
  }
}
