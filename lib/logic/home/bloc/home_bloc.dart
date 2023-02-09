import 'package:unsplash_app/logic/home/data/models/home_model.dart';
import 'package:unsplash_app/logic/home/data/repositories/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
//import '../data/models/bookVotes_model.dart';
import '../data/repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc(this.homeRepository) : super(HomeInitial()) {
    on<HomeLoad>((event, emit) async {
      emit(HomeLoading());
      try {
        final List<HomeModel> list = (await homeRepository.getListofPhotos()) as List<HomeModel>;
        //final Response list = await homeRepository.getListofPhotos();
        emit(HomeSuccess(list));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });
  }
}