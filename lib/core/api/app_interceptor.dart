import 'dart:developer';

import 'package:bastogah_app/core/api/end_point.dart';
import 'package:dio/dio.dart';
import '../local_storage_services/shared_preference_singleton.dart';
import '../routing/app_route.dart' show appRouter;
import '../routing/route_name.dart';
import 'api_keys.dart';
import 'status_code.dart';

// handle dio interceptors in dependencies injection file
class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors({required this.dio});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    log("dio interceptor Request : ${options.path}");
    String accessToken = SharedPreferenceSingleton.getString(
      ApiKeys.accessToken,
    );
    options.headers.addAll({"Authorization": "Bearer $accessToken"});
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("dio interceptor Response ");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    log("dio interceptor Error : ${err.toString()}");
    if (SharedPreferenceSingleton.getString(ApiKeys.accessToken).isNotEmpty) {
      if (err.response?.statusCode == StatusCode.unauthorized) {
        await refreshToken();
        String newAccessToken = SharedPreferenceSingleton.getString(
          ApiKeys.accessToken,
        );
        final requestOptions = err.requestOptions;
        requestOptions.headers.addAll({
          "Authorization": "Bearer $newAccessToken",
        });

        // ⚠️ Check if the body was FormData
        if (requestOptions.data is FormData) {
          final oldFormData = requestOptions.data as FormData;
          final Map<String, dynamic> newMap = {};
          for (final entry in oldFormData.fields) {
            newMap[entry.key] = entry.value;
          }
          for (final entry in oldFormData.files) {
            final file = entry.value;
            newMap[entry.key] = await MultipartFile.fromFile(
              file.filename!,
              filename: file.filename,
              contentType: file.contentType,
            );
          }
          requestOptions.data = FormData.fromMap(newMap);
        }

        final response = await dio.fetch(requestOptions);
        return handler.resolve(response);
      }
      if (err.response?.statusCode == StatusCode.refreshFailed) {
        await clearTokens();
        // change route according to role
        appRouter.go(RouteName.merchantLogin, extra: true);
        return;
      }
    }
    super.onError(err, handler);
  }

  Future<void> refreshToken() async {
    try {
      String refreshToken = SharedPreferenceSingleton.getString(
        ApiKeys.refreshToken,
      );
      var response = await dio.get(
        EndPoint.refreshToken,
        queryParameters: {"token": refreshToken},
      );
      String newAccessToken = response.data[ApiKeys.accessToken];
      log("newAccessToken : $newAccessToken");
      SharedPreferenceSingleton.setString(ApiKeys.accessToken, newAccessToken);
      log("refresh token success");
    } catch (e) {
      log("refresh token error : ${e.toString()}");
    }
  }

  Future<void> clearTokens() async {
    await SharedPreferenceSingleton.remove(ApiKeys.accessToken);
    await SharedPreferenceSingleton.remove(ApiKeys.refreshToken);
    await SharedPreferenceSingleton.remove(ApiKeys.userId);
    await SharedPreferenceSingleton.remove(ApiKeys.roles);
  }
}
