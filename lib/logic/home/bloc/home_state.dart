part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {

}
class HomeLoading extends HomeState {

}
class HomeFailure extends HomeState {
  final String message;

  HomeFailure(this.message);
}

class HomeSuccess extends HomeState {
  final List<HomeModel> list;
  HomeSuccess(this.list);
}