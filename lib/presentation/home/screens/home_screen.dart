import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_app/logic/home/bloc/home_bloc.dart';
import 'package:unsplash_app/presentation/home/widgets/list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: BlocConsumer<HomeBloc, HomeState>(listener: (context2, state) {
        if (state is HomeSuccess) {
          print(state.list.length);
        }
      }, builder: (context2, state) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: ListPhotoWidget(),
        );
      }),
    );
  }
}
