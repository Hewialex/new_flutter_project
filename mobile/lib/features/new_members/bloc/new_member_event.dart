part of 'new_member_bloc.dart';

sealed class NewMemberEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchData extends NewMemberEvent {}

class SelectOption extends NewMemberEvent {
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
