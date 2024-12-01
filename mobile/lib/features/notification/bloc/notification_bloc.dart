import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qismati/features/notification/data/notification_data.dart';
import 'package:qismati/features/notification/model/notification_model.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<NotificationReceived>(_notificationreceived);
    on<NotificationRead>(_notificationread);
    on<NotificationLoad>(_getNotifications);
    on<NotificationLoadMore>(_getMoreNotifications);
  }

  final NotificationDataProvider _notificationDataProvider = NotificationDataProvider();

  void _notificationreceived(
      NotificationReceived event, Emitter<NotificationState> emit) {
    try {
      var currentState = state;

      if (currentState is NotificationSuccess) {
        List<NotificationModel> oldNotifications = currentState.notifications;
        List<NotificationModel> newNotifications =
            List.from([event.notification])..addAll(oldNotifications);

        if (newNotifications.length > 10) {
          newNotifications = newNotifications.sublist(0, 10);
        }

        emit(NotificationSuccess(newNotifications));
      } else {
        emit(NotificationSuccess([event.notification]));
      }

      emit(NotificationSuccess([event.notification]));
    } catch (e) {
      emit(NotificationErrorState(e.toString()));
    }
  }

  void _notificationread(
      NotificationRead event, Emitter<NotificationState> emit) async {
    var currentState = state;

    try {
      if (currentState is NotificationSuccess) {
        NotificationModel notification = event.notification;

        // NotificationModel readNotification = await _notificationDataProvider
        //     .markNotificationAsRead(notificationId: notification.id);

        List<NotificationModel> oldNotifications = currentState.notifications;

        // List<NotificationModel> newNotifications = oldNotifications
        //     .where((element) => element.id != readNotification.id)
        //     .toList();

        List<NotificationModel> newNotifications = oldNotifications
            .where((element) => element.id != notification.id)
            .toList();

        emit(NotificationSuccess(newNotifications));
      }
    } catch (e) {
      emit(NotificationErrorState(e.toString()));
    }
  }

  void _getNotifications(
      NotificationLoad event, Emitter<NotificationState> emit) async {
    // final currState = state;
    try {
      emit(NotificationLoadingState(notifications: List.empty()));

      // final response = await _notificationDataProvider.getUnReadNotifications(page: event.page);
      // emit(NotificationSuccess(response.notifications, page: response.page));

      List<NotificationModel> notifications = [
        NotificationModel(
            id: "1",
            title: "Notification 1",
            type: NotificationType.like,
            data: const {},
            timestamp: DateTime(2023)),
        NotificationModel(
            id: "2",
            title: "Notification 2",
            type: NotificationType.like,
            data: const {},
            timestamp: DateTime(2023)),
        NotificationModel(
            id: "3",
            title: "Notification 3",
            type: NotificationType.like,
            data: const {},
            timestamp: DateTime(2023)),
      ];

      emit(NotificationSuccess(notifications));
    } catch (e) {
      emit(NotificationErrorState(e.toString()));
    }
  }

  void _getMoreNotifications(
      NotificationLoadMore event, Emitter<NotificationState> emit) async {
    try {
      var currentState = state;

      if (currentState is NotificationSuccess) {
        emit(
          NotificationLoadingState(notifications: currentState.notifications),
        );

        await Future.delayed(const Duration(seconds: 2));

        int nextPage = currentState.page + 1;
        debugPrint("Next Page: $nextPage");
        // final response = await _notificationDataProvider.getUnReadNotifications(
        //     page: nextPage);

        List<NotificationModel> notifications = [
          NotificationModel(
              id: "1",
              title: "Notification 1",
              type: NotificationType.like,
              data: const {},
              timestamp: DateTime(2023)),
          NotificationModel(
              id: "2",
              title: "Notification 2",
              type: NotificationType.like,
              data: const {},
              timestamp: DateTime(2023)),
          NotificationModel(
              id: "3",
              title: "Notification 3",
              type: NotificationType.like,
              data: const {},
              timestamp: DateTime(2023)),
        ];

        List<NotificationModel> oldNotifications = currentState.notifications;
        List<NotificationModel> newNotifications = List.from(oldNotifications)
          ..addAll(notifications);

        // emit(NotificationSuccess(newNotifications, page: response.page));
        emit(NotificationSuccess(newNotifications, page: nextPage));
      }
    } catch (e) {
      emit(NotificationErrorState(e.toString()));
    }
  }
}
