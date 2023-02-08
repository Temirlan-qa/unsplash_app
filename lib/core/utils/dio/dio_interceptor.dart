import 'dart:convert';

import 'package:dio/dio.dart';


import '../../../main.dart';
import '../../injection_container.dart';
import 'dio_wrapper.dart';

class DioInterceptor extends Interceptor {
  final Dio? dio;

  DioInterceptor({
    this.dio,
  });

  Future<Response> _retry(RequestOptions requestOptions) async {
    final options = Options(
        method: requestOptions.method,
        headers: requestOptions.headers
    );

    return DioWrapper(sl(), sl()).request(
        requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options
    );
  }

}