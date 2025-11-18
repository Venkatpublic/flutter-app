abstract class Failure {
  Failure([this.properties = const <dynamic>[]]);

  final List<dynamic> properties;

  // @override // Removed @override as Failure no longer extends Equatable
  // List<Object?> get props => properties;
}

// General failures
class ServerFailure extends Failure {
  final String message;
  ServerFailure({required this.message}) : super([message]);
}

class CacheFailure extends Failure {
  final String message;
  CacheFailure({required this.message}) : super([message]);
}

class NetworkFailure extends Failure {
  final String message;
  NetworkFailure({required this.message}) : super([message]);
}

class AuthFailure extends Failure {
  final String message;
  AuthFailure({required this.message}) : super([message]);
}
