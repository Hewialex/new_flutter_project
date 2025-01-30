import 'package:dio/dio.dart';
import 'package:qismati/core/error/api_exception.dart';
import 'package:qismati/core/error/cache_exception.dart';
import 'package:qismati/core/failurs/failur.dart';
import 'package:qismati/core/failurs/global_failures.dart';

class ErrorMapper {
  static Failure mapError(Object error, {String? errorLocation}) {
    if (error is Failure) {
      // If the error is already a Failure, return it directly
      return error;
    }

    if (error is DioException) {
      if (error.response != null) {
        final statusCode = error.response?.statusCode;
        final data = error.response?.data;
        final errorMessage = data['message'] ??
            data['errorResponse'] ??
            error.message ??
            'An error occurred';
        final extra = data['errorResponse'];

        return ApiFailure(errorMessage, statusCode: statusCode, extra: extra);
      } else if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        return NetworkFailure('Connection timed out. Please try again.');
      } else if (error.type == DioExceptionType.connectionError) {
        return NetworkFailure(
            'No internet connection. Please check your network.');
      } else {
        return ApiFailure(error.message ?? 'Something went wrong');
      }
    } else if (error is ApiException) {
      return ApiFailure(error.message, statusCode: error.statusCode);
    } else if (error is CacheException) {
      return CacheFailure(error.message);
    } else if (error is Exception) {
      return UnknownFailure(
          'An unknown exception occurred: ${error.toString()}');
    } else {
      return UnknownFailure('An unknown error occurred: ${error.toString()}');
    }
  }
}
