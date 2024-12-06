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
    on<NotificationClearAll>(_clearAllNotifications);
  }

  final NotificationDataProvider _notificationDataProvider =
      NotificationDataProvider();

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

        NotificationModel readNotification = await _notificationDataProvider
            .markNotificationAsRead(notificationId: notification.id);

        List<NotificationModel> oldNotifications = currentState.notifications;

        List<NotificationModel> newNotifications = oldNotifications
            .where((element) => element.id != readNotification.id)
            .toList();

        emit(NotificationSuccess(newNotifications));
      }
    } catch (e) {
      emit(NotificationErrorState(e.toString()));
    }
  }

  void _getNotifications(
      NotificationLoad event, Emitter<NotificationState> emit) async {
    final currState = state;
    try {
      (currState is NotificationSuccess)
          ? emit(
              NotificationLoadingState(notifications: currState.notifications))
          : emit(NotificationLoadingState(notifications: List.empty()));

      final response = await _notificationDataProvider.getUnReadNotifications(
          page: event.page);

      print(response);

      emit(NotificationSuccess(response.notifications, page: response.page));
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

        int nextPage = currentState.page + 1;
        debugPrint("Next Page: $nextPage");
        final response = await _notificationDataProvider.getUnReadNotifications(
            page: nextPage);

        List<NotificationModel> oldNotifications = currentState.notifications;
        List<NotificationModel> newNotifications = List.from(oldNotifications)
          ..addAll(response.notifications);

        emit(NotificationSuccess(newNotifications,
            page: response.page, hasReachedMax: response.hasReachedMax));
      }
    } catch (e) {
      emit(NotificationErrorState(e.toString()));
    }
  }

  void _clearAllNotifications(
      NotificationClearAll event, Emitter<NotificationState> emit) async {
    try {
      final currState = state;
      if (currState is NotificationSuccess) {
        await _notificationDataProvider.clearAllNotifications();
        emit(NotificationSuccess(List.empty()));
      }
    } catch (e) {
      emit(NotificationErrorState(e.toString()));
    }
  }
}
