abstract class Failure {
  final String message;
  final String? extra;

  Failure(this.message, {this.extra});

  @override
  String toString() => message;
}
