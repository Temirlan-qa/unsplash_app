import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:unsplash_app/logic/home/data/datasources/home_datasource.dart';
import 'package:unsplash_app/logic/home/data/repositories/home_repository.dart';



var sl = GetIt.instance;

void initGetIt() async {


  sl.registerLazySingleton<HomeDataSource>(
        () => HomeDataSourceImpl(dioWrapper: sl()),
  );

  sl.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(sl()),
  );

  // sl.registerFactory<ProfileBloc>(
  //       () => ProfileBloc(sl()),
  // );

}