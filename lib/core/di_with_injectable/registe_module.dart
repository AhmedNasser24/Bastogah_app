import 'package:bastogah_app/core/api/api_consumer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../api/app_interceptor.dart';
import '../api/dio_consumer.dart';
import '../api/end_point.dart';

@module
abstract class CoreInjectableModule {
  @singleton
  Dio dio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: EndPoint.baseUrl,
        connectTimeout: const Duration(seconds: 45),
        receiveTimeout: const Duration(seconds: 45),
      ),
    );

    return dio;
  }

  @singleton
  ApiConsumer dioConsumer(Dio dio) {
    dio.interceptors.add(AppInterceptors(dio: dio));
    dio.interceptors.addAll([
      if (kDebugMode)
        PrettyDioLogger(
          request: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
          compact: true,
          requestHeader: true,
        ),
    ]);
    return DioConsumer(dio: dio);
  }

  @lazySingleton
  CancelToken cancelToken() => CancelToken();
}
