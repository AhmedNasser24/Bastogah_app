import 'package:dio/dio.dart';
import 'dart:developer';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  const ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    log("on dio exception : ${dioException.toString()}");
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection time out with ApiServer');
      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send time out with ApiServer');
      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Recieve time out with ApiServer');
      case DioExceptionType.badCertificate:
        return const ServerFailure('Bad certificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return const ServerFailure('Your request is canceled');
      case DioExceptionType.connectionError:
        return const ServerFailure('check your internet connection and try again');
      case DioExceptionType.unknown:
        return const ServerFailure('unKnown Error');
    }
  }

  factory ServerFailure.fromBadResponse(
    int statusCode,
    Map<String, dynamic> errData,
  ) {
    if (statusCode == 400 || statusCode == 401 ) {
      return ServerFailure(errData["errorMassege"]);
    } else {
      return const ServerFailure('Unknown bad response');
    }
  }

  factory ServerFailure.defaultFailure(String errMessage) {
    log("default Failure :  $errMessage");
    return ServerFailure(errMessage);
  }
}
