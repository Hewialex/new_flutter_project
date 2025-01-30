import 'package:qismati/core/failurs/failur.dart';

class ApiFailure extends Failure {
  final int? statusCode;

  ApiFailure(super.message, {this.statusCode, super.extra});

  @override
  String toString() => message;
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class ValidationFailure extends Failure {
  ValidationFailure(super.message);
}

class UnknownFailure extends Failure {
  UnknownFailure(super.message);
}
