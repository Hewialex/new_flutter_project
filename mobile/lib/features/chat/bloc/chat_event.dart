part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GiveMeData extends ChatEvent {
  final String id;

  GiveMeData({required this.id});

  @override
  List<Object?> get props => [id];
}

class AcceptChatNotice extends ChatEvent {
  final String id;

  AcceptChatNotice({required this.id});

  @override
  List<Object?> get props => [id];
}

class SendText extends ChatEvent {}
