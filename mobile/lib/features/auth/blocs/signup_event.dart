part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterUser extends SignupEvent {
  final SignupModel signupModel;
  final String gender;

  RegisterUser({
    required this.signupModel,
    required this.gender,
  });

  @override
  List<Object?> get props => [signupModel, gender];
}
