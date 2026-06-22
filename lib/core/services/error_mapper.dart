import 'package:dio/dio.dart';

import '../constants/strings.constants.dart';

String mapErrorToMessage(Object error) {
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return Strings.common.networkError;
      default:
        return Strings.common.genericError;
    }
  }
  return Strings.common.genericError;
}
