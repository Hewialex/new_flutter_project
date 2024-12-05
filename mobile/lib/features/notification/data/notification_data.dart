import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:qismati/core/database/database_helper.dart';
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
  final DatabaseHelper databaseHelper = DatabaseHelper();
  final InternetConnectionChecker internetConnectionChecker =
      InternetConnectionChecker();

  Future<GetNotificationResponse> getUnReadNotifications({
    required int page,
  }) async {
    try {
      final String? token = await databaseHelper.getToken();
      final response = await http.get(
        Uri.parse("$_baseUrl/notification/get/unread?page=$page&limit=$limit"),
        headers: {
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode != 200) {
        throw Exception("Failed to load notifications");
      }

      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> notifications = data['data']['notifications'];

      return GetNotificationResponse(
        notifications: notifications
            .map(
              (notificationJson) =>
                  NotificationModel.fromJson(notificationJson),
            )
            .toList(),
        page: data['data']['page'],
        hasReachedMax: data['data']['hasReachedMax'],
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<GetNotificationResponse> getAllNotifications({
    required int page,
    limit = 10,
  }) async {
    try {
      final String? token = await databaseHelper.getToken();

      final response = await http.get(
        Uri.parse("$_baseUrl/notification/get/all?page=$page&limit=$limit"),
        headers: {
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode != 200) {
        throw Exception("Failed to load notifications");
      }

      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> notifications = data['data']['notifications'];

      return GetNotificationResponse(
        notifications: notifications
            .map((notificationJson) =>
                NotificationModel.fromJson(notificationJson))
            .toList(),
        page: data['data']['page'],
        hasReachedMax: data['data']['hasReachedMax'],
      );
    } catch (e) {
      throw Exception("Failed to load notifications");
    }
  }

  Future<NotificationModel> markNotificationAsRead(
      {required String notificationId}) async {
    try {
      final String? token = await databaseHelper.getToken();
      final response = await http.patch(
        Uri.parse("$_baseUrl/notification/mark/read/$notificationId"),
        headers: {
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print(" [-] Response is : ${response.body}");

      if (response.statusCode != 200) {
        throw Exception("Failed to mark notification as read.");
      }

      final Map<String, dynamic> data = json.decode(response.body);
      final dynamic notification = data['data']['notifications'];
      print("[-] data $data");
      print("[-] notification $notification");

      return NotificationModel.fromJson(notification);
    } catch (e) {
      print(" [-] Error is : $e");
      rethrow;
    }
  }

  Future<NotificationModel> markNotificationAsUnread(
      {required String notificationId}) async {
    try {
      final String? token = await databaseHelper.getToken();
      final response = await http.patch(
        Uri.parse("$_baseUrl/notification/mark/unread/$notificationId"),
        headers: {
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode != 200) {
        throw Exception("Failed to mark notification as unread.");
      }

      final Map<String, dynamic> data = json.decode(response.body);
      final dynamic notification = data['data']['notification'];

      return NotificationModel.fromJson(notification);
    } catch (e) {
      throw Exception("Failed to mark notification as unread.");
    }
  }

  Future<void> markAllNotificationsAsRead() async {
    try {
      final String? token = await databaseHelper.getToken();
      final response = await http.patch(
        Uri.parse("$_baseUrl/notification/mark/readall"),
        headers: {
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode != 200) {
        throw Exception("Failed to mark all notifications as read.");
      }
    } catch (e) {
      throw Exception("Failed to mark all notifications as read.");
    }
  }
}
