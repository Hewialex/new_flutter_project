part of 'online_member_bloc.dart';

sealed class OnlineMemberState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnlineMemberInitial extends OnlineMemberState {}

class OnlineMemberLoading extends OnlineMemberState {}

class OnlineMemberLoaded extends OnlineMemberState {
  final List<ProfileModel> users;
  final OnlineMemberError error;

  OnlineMemberLoaded({required this.users, required this.error});

  @override
  List<Object?> get props => [users, error];
}

enum OnlineMemberError { none, network, server }
