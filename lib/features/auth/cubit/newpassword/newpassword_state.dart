part of 'newpassword_cubit.dart';

abstract class NewpasswordState extends Equatable {
  const NewpasswordState();

  @override
  List<Object> get props => [];
}

class NewpasswordInitial extends NewpasswordState {}

class NewpasswordLoading extends NewpasswordState {}

class NewpasswordSuccess extends NewpasswordState {
  final String message;

  const NewpasswordSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class NewpasswordFailure extends NewpasswordState {
  final String message;

  const NewpasswordFailure({required this.message});

  @override
  List<Object> get props => [message];
}
