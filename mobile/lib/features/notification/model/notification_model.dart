import 'package:equatable/equatable.dart';

enum NotificationType { like, message, chatroom, system }

class NotificationModel extends Equatable {
  final String id;
  final String title;
  final NotificationType type;
  final Map<String, dynamic> data;
  final DateTime timestamp;
  final String? fromUserId;
  final Map<String, dynamic>? extra;

  const NotificationModel({
    required this.id,
    required this.title,
    required this.type,
    required this.data,
    required this.timestamp,
    this.fromUserId,
    this.extra,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        id: json["id"],
        title: json["title"],
        type: json["type"] as NotificationType,
        data: json["data"],
        timestamp: json["timestamp"],
        fromUserId: json["fromUserId"],
        extra: json["extra"]);
  }

  @override
  List<Object?> get props => [id];
}
