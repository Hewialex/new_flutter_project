part of 'nearyou_bloc.dart';

sealed class NearYouState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NearYouInitial extends NearYouState {
  @override
  List<Object?> get props => [];
}

class NearYouLoaded extends NearYouState {
  final List<People> people;
  final int page;
  final bool hasReachedMax;

  NearYouLoaded({required this.people, required this.page, this.hasReachedMax = false});

  @override
  List<Object?> get props => [people];
}

class NearYouLoading extends NearYouState {
  final List<People> people;

  NearYouLoading({this.people = const []});

  @override
  List<Object?> get props => [people];
}

class NearYouError extends NearYouState {
  final String message;

  NearYouError({required this.message});

  @override
  List<Object?> get props => [message];
}
