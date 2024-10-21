part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginDefault extends LoginState {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final LoginErr err;

  LoginDefault({
    required this.emailController,
    required this.passwordController,
    required this.err,
  });
}

class LoginVerification extends LoginState {}

class LoginSuccess extends LoginState {}

enum LoginErr {
  none,
  network,
  userNotFound,
  input,
}
