part of 'login_status_bloc.dart';

sealed class LoginStatusEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginStatusCheck extends LoginStatusEvent {}
