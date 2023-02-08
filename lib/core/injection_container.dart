import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:unsplash_app/core/utils/dio/dio_interceptor.dart';
var sl = GetIt.instance;

void initGetIt() async {


  sl.registerLazySingleton<ProfileDatasource>(
        () => ProfileDatasourceImpl(dioWrapper: sl()),
  );

  sl.registerLazySingleton<ProfileRepository>(
        () => ProfileRepositoryImpl(sl()),
  );

  sl.registerFactory<ProfileBloc>(
        () => ProfileBloc(sl()),
  );

}