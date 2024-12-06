part of 'chat_list_bloc.dart';

sealed class ChatListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetChatList extends ChatListEvent {}

//web socket servcie??
class UpdateChatList extends ChatListEvent {}
