class NetworkException implements Exception {
  NetworkException();
}

class LocationException implements Exception {
  final String message;

  LocationException(this.message);
}
