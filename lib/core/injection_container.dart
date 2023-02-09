import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:unsplash_app/core/const/environment_config.dart';
import 'package:unsplash_app/core/utils/dio/dio_wrapper.dart';
import 'package:unsplash_app/logic/home/data/datasources/home_datasource.dart';
import 'package:unsplash_app/logic/home/data/repositories/home_repository.dart';

import '../logic/home/bloc/home_bloc.dart';



var sl = GetIt.instance;

void initGetIt() async {
  sl.registerFactory<DioWrapper>(
        () => DioWrapper(sl(),),
  );
  sl.registerFactory<Dio>(
        () => Dio(BaseOptions(baseUrl: EnvironmentConfig.url)),
  );
  sl.registerLazySingleton<HomeDataSource>(
        () => HomeDataSourceImpl(dioWrapper: sl()),
  );

  sl.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(sl()),
  );

  sl.registerFactory<HomeBloc>(
        () => HomeBloc(sl()),
  );

}