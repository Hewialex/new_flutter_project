part of 'login_status_bloc.dart';

sealed class LoginStatusState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginStatusInitial extends LoginStatusState {}

class LoginStatusDefault extends LoginStatusState {}

class LoginStatusSuccess extends LoginStatusState {}
