part of 'username_cubit.dart';

abstract class UsernameState {}

class UsernameInitial extends UsernameState {}

class UsernameLoading extends UsernameState {}

class UsernameAvailable extends UsernameState {
  final String message;

  UsernameAvailable({required this.message});
}

class UsernameTaken extends UsernameState {
  final String message;

  UsernameTaken({required this.message});
}
