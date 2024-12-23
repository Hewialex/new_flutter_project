part of 'online_member_bloc.dart';

sealed class OnlineMemberEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchData extends OnlineMemberEvent {}

class SelectOption extends OnlineMemberEvent {
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
