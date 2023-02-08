import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:unsplash_app/core/utils/dio/dio_wrapper.dart';

abstract class HomeRemoteDataSource {
  Future<Response> getListofPhotos();
}

class HomeDataSourceImpl implements HomeRemoteDataSource {
  final DioWrapper? dioWrapper;
  BookRemoteDataSourceImpl({this.dioWrapper}) {
    dioWrapper?.path = '';
  }

  @override
  Future<Response> getListofPhotos() async {
    Response response = await dioWrapper!.get('/photos/?client_id=ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9',);
    // ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9 = id
    // u can use like that $id
    return response;
  }
}