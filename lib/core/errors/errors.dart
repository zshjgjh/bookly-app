import 'package:dio/dio.dart';

class Failure{
  final String errorMessage;

  Failure(this.errorMessage);
}
class ServerFailure extends Failure{
  ServerFailure(String errorMessage) : super(errorMessage);

  factory ServerFailure.fromDioError(DioException dioError){
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with Api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with Api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with Api server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with Api server');
      case DioExceptionType.badResponse:
       return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
      return ServerFailure('Request to Api server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet Connection ');
      case DioExceptionType.unknown:
        return ServerFailure('Oops there was an error, please try later!');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your request was not found, please try later');
    } else if (statusCode == 500) {
      return ServerFailure('There is a problem with server, please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('There was an error , please try later!');
    }
  }
}