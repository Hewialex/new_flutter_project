
import 'package:qismati/features/notification/model/notification_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class GetNotificationResponse {
  final List<NotificationModel> notifications;
  final int page;
  final bool hasReachedMax;

  GetNotificationResponse({
    required this.notifications,
    required this.page,
    required this.hasReachedMax,
  });
}

class NotificationDataProvider {

  final String _baseUrl = "https://dating-backend-sf1t.onrender.com/api/v1";
  final int limit = 10;

  Future<GetNotificationResponse> getUnReadNotifications({
    required int page,
  }) async {
    try {
      final response = await http.get(
          Uri.parse("$_baseUrl/notification/get/unread?page=$page&limit=$limit"));

      if (response.statusCode != 200) {
        throw Exception("Failed to load notifications");
      }

      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> notifications = data['data']['notifications'];

      return GetNotificationResponse(
        notifications: notifications
            .map((notificatinoJson) =>
                NotificationModel.fromJson(notificatinoJson))
            .toList(),
        page: data['data']['page'],
        hasReachedMax: data['data']['hasReachedMax'],
      );
    } catch (e) {
      throw Exception("Failed to load notifications");
    }
  }

  Future<GetNotificationResponse> getAllNotifications({
    required int page,
    limit = 10,
  }) async {
    try {
      final response = await http.get(
          Uri.parse("$_baseUrl/notification/get/all?page=$page&limit=$limit"));

      if (response.statusCode != 200) {
        throw Exception("Failed to load notifications");
      }

      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> notifications = data['data']['notifications'];

      return GetNotificationResponse(
        notifications: notifications
            .map((notificatinoJson) =>
                NotificationModel.fromJson(notificatinoJson))
            .toList(),
        page: data['data']['page'],
        hasReachedMax: data['data']['hasReachedMax'],
      );
    } catch (e) {
      throw Exception("Failed to load notifications");
    }
  }


  Future<NotificationModel> markNotificationAsRead({required String notificationId}) async {
    try {
      final response = await http.patch(
          Uri.parse("$_baseUrl/notification/mark/read/$notificationId"));

      if (response.statusCode != 200) {
        throw Exception("Failed to mark notification as read.");
      }

      final Map<String, dynamic> data = json.decode(response.body);
      final dynamic notification = data['data']['notification'];

      return NotificationModel.fromJson(json.decode(notification));
    } catch (e) {
        throw Exception("Failed to mark notification as read.");
    }
  }

  Future<NotificationModel> markNotificationAsUnread(
      {required String notificationId}) async {
    try {
      final response = await http.patch(
          Uri.parse("$_baseUrl/notification/mark/unread/$notificationId"));

      if (response.statusCode != 200) {
        throw Exception("Failed to mark notification as unread.");
      }

      final Map<String, dynamic> data = json.decode(response.body);
      final dynamic notification = data['data']['notification'];

      return NotificationModel.fromJson(json.decode(notification));
    } catch (e) {
        throw Exception("Failed to mark notification as unread.");
    }
  }

  Future<void> markAllNotificationsAsRead() async {
    try {
      final response = await http.patch(
          Uri.parse("$_baseUrl/notification/mark/readall"));
        
      if (response.statusCode != 200) {
        throw Exception("Failed to mark all notifications as read.");
      }
    } catch (e) {
      throw Exception("Failed to mark all notifications as read.");
    }
  }
}
