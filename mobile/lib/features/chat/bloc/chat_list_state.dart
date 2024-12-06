part of 'chat_list_bloc.dart';

sealed class ChatListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChatListInitial extends ChatListState {}

class ChatListLoading extends ChatListState {}

class ChatListLoaded extends ChatListState {
  final List<ChatListModel> chatListModel;

  ChatListLoaded({required this.chatListModel});

  @override
  List<Object?> get props => [chatListModel];
}

class ChatListError extends ChatListState {
  final String errorMessage;

  ChatListError({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
