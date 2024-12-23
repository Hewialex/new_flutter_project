part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  @override
  List<Object?> get props => [];

  void dispose() {}
}

class LoginDefault extends LoginState {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final LoginErr? err;
  final String? errorMessage;

  LoginDefault({
    required this.emailController,
    required this.passwordController,
    this.err,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [emailController, passwordController, err];

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  LoginDefault copyWith({
    LoginErr? err,
    String? errorMessage,
  }) {
    return LoginDefault(
      emailController: emailController,
      passwordController: passwordController,
      err: err,
      errorMessage: errorMessage,
    );
  }
}

class LoginVerification extends LoginState {}

class LoginSuccess extends LoginState {}

enum LoginErr {
  none,
  network,
  userNotFound,
  input,
}
