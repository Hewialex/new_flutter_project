part of 'new_member_bloc.dart';

sealed class NewMemberState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewMemberInitial extends NewMemberState {}

class NewMemberLoading extends NewMemberState {}

class NewMemberLoaded extends NewMemberState {
  final List<ProfileModel> users;
  final NewMemberError error;

  NewMemberLoaded({required this.users, required this.error});

  @override
  List<Object?> get props => [users, error];
}

enum NewMemberError { none, network, server }
