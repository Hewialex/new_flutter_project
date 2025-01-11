part of 'new_password_bloc.dart';

abstract class NewPasswordState extends Equatable {
  const NewPasswordState();

  @override
  List<Object?> get props => [];

  void dispose() {}
}

class NewPassWordInitial extends NewPasswordState {
  final TextEditingController confirmPasswordController;
  final TextEditingController passwordController;

  const NewPassWordInitial({
    required this.confirmPasswordController,
    required this.passwordController,
  });

  @override
  List<Object?> get props => [confirmPasswordController, passwordController];

  @override
  void dispose() {
    confirmPasswordController.dispose();
    passwordController.dispose();
  }

  NewPassWordInitial copyWith({
    String? errorMessage,
  }) {
    return NewPassWordInitial(
      confirmPasswordController: confirmPasswordController,
      passwordController: passwordController,
    );
  }
}
