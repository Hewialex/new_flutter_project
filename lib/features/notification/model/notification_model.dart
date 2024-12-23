import 'package:equatable/equatable.dart';

enum NotificationType { like, message, chatroom, system }

const Map<String, NotificationType> notificationTypeMap = {
  "like": NotificationType.like,
  "message": NotificationType.message,
  "chatroom": NotificationType.chatroom,
  "system": NotificationType.system,
};

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
    // {data: {chatroomId: null, message: Hello Pal}, fromUserId: null, _id: 674f8bc5c487f543be549b40, type: system, read: false, title: Notification For Testing, userId: 674f01822c45815c3eea90fd}], page: 1, hasReachedMax: false}
    print(json);
    assert (json.containsKey("_id"));
    assert (json.containsKey("title"));
    assert (json.containsKey("type"));
    assert (json.containsKey("data"));
    assert (json.containsKey("createdAt"));

    assert (notificationTypeMap.containsKey(json["type"]));
    assert (json["createdAt"] is String);
    assert (json["_id"] is String);


    return NotificationModel(
        id: json["_id"],
        title: json["title"],
        type: notificationTypeMap[json["type"]]!,
        data: json["data"] as Map<String, dynamic>,
        timestamp: DateTime.parse(json["createdAt"]),
        fromUserId: json["fromUserId"],
        extra: json["extra"]);
  }

  @override
  List<Object?> get props => [id];
}
