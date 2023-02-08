import 'package:dio/dio.dart';
import 'dio_interceptor.dart';

class DioWrapper {
  final Dio _dio;
  final DioInterceptor _dioInterceptor;

  DioWrapper(this._dio, this._dioInterceptor) {
    _dio.interceptors.add(_dioInterceptor);
  }

  String _path = '';

  set path(String value) => this._path = value;

  Future<Response> get(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        void Function(int, int)? onReceiveProgress,
      }) {
    return _dio.get(
      _path + path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }
}