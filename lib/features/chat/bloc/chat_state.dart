part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatNotice extends ChatState {}

class ChatDefault extends ChatState {
  final List<ChatText> chatText;
  final TextEditingController messageController;

  ChatDefault({
    required this.chatText,
    required this.messageController,
  });

  @override
  List<Object?> get props => [chatText];
}

class ChatText {
  final bool isSender;
  final String bubbleContent;
  final DateTime textTime;

  ChatText({
    required this.isSender,
    required this.bubbleContent,
    required this.textTime,
  });
}
