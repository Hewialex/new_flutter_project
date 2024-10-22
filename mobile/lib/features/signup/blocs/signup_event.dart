part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AttemptSignupAsMan extends SignupEvent {
  AttemptSignupAsMan();
}

class AttemptSignupAsWoman extends SignupEvent {
  AttemptSignupAsWoman();
}

class SignupReset extends SignupEvent {}