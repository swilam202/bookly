import 'package:dio/dio.dart';

class Failures {
  String errorMessage;

  Failures(this.errorMessage);

  factory Failures.exception(DioException exception){
    switch (exception.type) {
      case DioException.badResponse:
        return Failures('sorry, bad response');
      case DioException.connectionError:
        return Failures('sorry, connection error');
      case DioException.connectionTimeout:
        return Failures('sorry, connection timeout');
      case DioException.receiveTimeout:
        return Failures('sorry, receive timeout');
      case DioException.requestCancelled:
        return Failures('sorry, request was cancelled');
      case DioException.sendTimeout:
        return Failures('sorry, send timeout');
      default:
        return Failures('sorry, something went wrong please try again');
    }
  }
}



