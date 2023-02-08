import 'package:dio/dio.dart';


class DioWrapper {
  final Dio _dio;


  DioWrapper(this._dio) {
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