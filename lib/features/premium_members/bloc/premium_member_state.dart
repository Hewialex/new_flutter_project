part of 'premium_member_bloc.dart';

sealed class PremiumMemberState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PremiumMemberInitial extends PremiumMemberState {}

class PremiumMemberLoading extends PremiumMemberState {}

class PremiumMemberLoaded extends PremiumMemberState {
  final List<ProfileModel> users;
  final PremiumMemberError error;

  PremiumMemberLoaded({required this.users, required this.error});

  @override
  List<Object?> get props => [users, error];
}

enum PremiumMemberError { none, network, server }
