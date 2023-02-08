import 'package:dio/dio.dart';
import 'package:unsplash_app/logic/home/data/datasources/home_datasource.dart';


abstract class HomeRepository {
  Future<Response> getBookDailySum();
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl(this.homeDataSource);

  @override
  Future<Response> getBookDailySum() async {
    Response response = await homeDataSource.getListofPhotos();

    return response;
  }
}