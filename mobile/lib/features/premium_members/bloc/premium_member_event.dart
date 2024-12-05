part of 'premium_member_bloc.dart';

sealed class PremiumMemberEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchData extends PremiumMemberEvent {}

class SelectOption extends PremiumMemberEvent {
  final String option;
  final String userId;
  final int removedIndex;

  SelectOption({
    required this.option,
    required this.userId,
    required this.removedIndex,
  });

  @override
  List<Object?> get props => [option, userId, removedIndex];
}
