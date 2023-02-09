import 'package:flutter/material.dart';
import 'package:unsplash_app/logic/data/models/gallery_model.dart';
import 'package:unsplash_app/logic/data/services_api_provider.dart';

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
        title: const Text('Gallery'),
      ),
      body: FutureBuilder<List<Photo>>(
        future: photos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final photos = snapshot.data;
            return ListView.builder(
              itemCount: photos!.length,
              itemBuilder: (context, index) {
                final photo = photos[index];
                return ListTile(
                  leading: Image.network(
                    photo.urls,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(photo.author),
                  subtitle: Text(photo.description),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhotoScreen(photo: photo),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
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
            photo.urls,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider(
//       create: (context) => GalleryListRepository(),
//       child: BlocProvider(
//         create: (context) => GalleryBloc(
//             galleryRepository: context.read<GalleryListRepository>())
//           ..add(GalleryLoadEvent()),
//         child: Scaffold(
//           appBar: AppBar(
//             elevation: 0,
//             title: const Text(
//               "Home Page",
//               style: TextStyle(
//                 color: Colors.black,
//               ),
//             ),
//             centerTitle: true,
//             backgroundColor: Colors.white,
//           ),
//           body:
//           BlocConsumer<GalleryBloc, GalleryState>(
//               listener: (context, state) {
//                 print(state);
//               },
//               builder: (context, state) {
//             if (state is GalleryEmptyState) {
//               return const Center(
//                 child: Text(
//                   'No data received. Please button "Load"',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               );
//             }
//
//             if (state is GalleryLoadingState) {
//               return const Text(
//                 "GalleryLoadingState",
//                 style: TextStyle(color: Colors.black),
//               );
//             }
//             if (state is GalleryLoadedState) {
//               return Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: InkWell(
//                   onTap: () {
//                     print("Hi");
//                   },
//                   child: ListPhotoWidget(
//                     list: state.loadedGallery,
//                   ),
//                 ),
//               );
//             }
//             if (state is GalleryErrorState) {
//               return const Text(
//                 'Error fetching users',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   fontSize: 20.0,
//                   color: Colors.white,
//                 ),
//               );
//             }
//             return const SizedBox.shrink(
//               child: Text(
//                 "123",
//                 style: TextStyle(color: Colors.black),
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
