part of 'notification_bloc.dart';

sealed class NotificationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NotificationReceived extends NotificationEvent {
  final NotificationModel notification;

  NotificationReceived(this.notification);

  @override
  List<Object?> get props => [notification];
}

class NotificationRead extends NotificationEvent {
  final NotificationModel notification;

  NotificationRead(this.notification);

  @override
  List<Object?> get props => [notification];
}

class NotificationLoad extends NotificationEvent {
  final int page;
  final int limit;

  NotificationLoad({this.page = 1, this.limit = 10});

  @override
  List<Object?> get props => [page, limit];
}

class NotificationLoadMore extends NotificationEvent {
  NotificationLoadMore();

  @override
  List<Object?> get props => [];
}
