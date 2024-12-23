part of 'myprofile_bloc.dart';

sealed class MyprofileState extends Equatable {
  @override
  List<Object> get props => [];
}

class MyprofileInitial extends MyprofileState {}

class MyprofileLoading extends MyprofileState {
  final ProfileModel? profile;

  MyprofileLoading({this.profile});

  @override
  List<Object> get props => [];

}

class MyprofileSuccess extends MyprofileState {
  final ProfileModel profile;

  MyprofileSuccess(this.profile);

  @override
  List<Object> get props => [profile];
}

class MyprofileError extends MyprofileState {
  final String message;

  MyprofileError(this.message);

  @override
  List<Object> get props => [message];
}

class MyprofileUpdateSuccess extends MyprofileState {
  final ProfileModel profile;
  final String message;

  MyprofileUpdateSuccess({
    required this.profile,
    required this.message,
  });

  @override
  List<Object> get props => [profile];
}

class MyprofileUpdateError extends MyprofileState {
  final ProfileModel profile;
  final String message;

  MyprofileUpdateError({
    required this.profile,
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
