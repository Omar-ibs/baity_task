import 'package:dio/dio.dart';

abstract class Failure {
  final errMessage;
  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError){
    switch(dioError.type){
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection request timeout with API.');
      case DioExceptionType.sendTimeout:
      return ServerFailure('Send request timeout with API.');
      case DioExceptionType.receiveTimeout:
      return ServerFailure('Receive request timeout with API.');
      case DioExceptionType.badCertificate:
      return ServerFailure('There is an error please try again.');
      case DioExceptionType.badResponse:
      return ServerFailure.fromResponse(dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
      return ServerFailure('Request to API was cancelled');
      case DioExceptionType.connectionError:
      return ServerFailure('There is an error with the internet connection');
      case DioExceptionType.unknown:
      return ServerFailure('Unexpected Error, please try again later.');
    }
  }
factory ServerFailure.fromResponse(int? statusCode,dynamic dioError){
  if (statusCode==400||statusCode==401||statusCode==403) {
    return ServerFailure(dioError['error']['message']);
  } else if(statusCode==404){
    return ServerFailure('The request is not found,please try later!.');
  }else if(statusCode==500){
   return ServerFailure('Internal server error,Please try again later');
  }else{
   return ServerFailure('Oops,there is an error ,please try again later.');
  }
}
}