import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constants.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 60);

    if (_dio == null) {
      _dio = Dio();
      _dio!.options
        ..baseUrl = ApiConstants.baseUrl
        ..connectTimeout = timeOut
        ..receiveTimeout = timeOut
        ..validateStatus = (status) {
          return status! <= 500;
        };

      _addFreeDioInterceptors();
      return _dio!;
    } else {
      return _dio!;
    }
  }

  static void _addFreeDioInterceptors() {
    _dio!.interceptors.addAll(
      [
        !kReleaseMode
            ? PrettyDioLogger(
                requestHeader: true,
                requestBody: true,
                responseBody: true,
                responseHeader: false,
              )
            : const Interceptor(),
      ],
    );
  }
}
