import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_app/logic/bloc/gallery/gallery_bloc.dart';
import 'package:unsplash_app/logic/bloc/gallery/gallery_event.dart';
import 'package:unsplash_app/logic/bloc/gallery/gallery_state.dart';
import 'package:unsplash_app/logic/data/gallery_repository.dart';
import 'package:unsplash_app/presentation/home/widgets/list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => GalleryListRepository(),
      child: BlocProvider(
        create: (context) => GalleryBloc(galleryRepository: context.read<GalleryListRepository>())..add(GalleryLoadEvent()),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              "Home Page",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body:
          BlocBuilder<GalleryBloc, GalleryState>(builder: (context, state) {
            if (state is GalleryEmptyState) {
              return const Center(
                child: Text(
                  'No data received. Please button "Load"',
                  style: TextStyle(fontSize: 20),
                ),
              );
            }

            if (state is GalleryLoadingState) {
              return const Text("GalleryLoadingState");
            }
            if (state is GalleryLoadedState) {
              return Padding(
                padding: EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: (){
                    print("Hi");
                  },
                  child: ListPhotoWidget(
                    list: state.loadedGallery,
                  ),
                ),
              );
            }
            if (state is GalleryErrorState) {
              return const Text(
                'Error fetching users',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20.0,
                  color: Colors.white,
                ),
              );
            }
            return const SizedBox.shrink();
          }),
        ),
      ),
    );
  }
}
