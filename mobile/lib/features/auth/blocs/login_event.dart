part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AttemptLogin extends LoginEvent {}
