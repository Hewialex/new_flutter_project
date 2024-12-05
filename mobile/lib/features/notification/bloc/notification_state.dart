part of 'notification_bloc.dart';

sealed class NotificationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationSuccess extends NotificationState {
  final List<NotificationModel> notifications;
  final int page;
  final bool hasReachedMax;

  NotificationSuccess(this.notifications, {this.page = 1, this.hasReachedMax = false});

  @override
  List<Object?> get props => [notifications, page, hasReachedMax];
}

class NotificationLoadingState extends NotificationState {
  final List<NotificationModel> notifications;

  NotificationLoadingState({required this.notifications});

  @override
  List<Object?> get props => [notifications];

  get hasReachedMax => null;
}

class NotificationErrorState extends NotificationState {
  final String message;

  NotificationErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
