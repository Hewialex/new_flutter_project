import 'package:equatable/equatable.dart';
import 'package:qismati/common/models/profile.dart';

class ChatListModel extends Equatable {
  final String chatId;
  final List<String> userIds;
  final ProfileModel otherUser;
  final bool active;
  final String? lastChatMessageId;

  const ChatListModel({
    required this.chatId,
    required this.userIds,
    required this.active,
    required this.otherUser,
    required this.lastChatMessageId,
  });

  factory ChatListModel.fromJson(Map<String, dynamic> json) {
    final List<String> userIds = json['userIds'].cast<String>();
    return ChatListModel(
      chatId: json['_id'],
      userIds: userIds,
      active: json['active'],
      lastChatMessageId: json['lastChatMessageId'] ?? '',
      otherUser: ProfileModel.fromJson(json['otherUser']),
    );
  }
  @override
  List<Object?> get props => [chatId, userIds, active];
}
