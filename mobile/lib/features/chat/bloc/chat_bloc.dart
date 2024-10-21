import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'chat_state.dart';
part 'chat_event.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<GiveMeData>(_giveMeData);
    on<AcceptChatNotice>(_acceptChatNotice);
    on<SendText>(_sendText);
  }
  FutureOr<void> _sendText(SendText event, emit) {
    if (state is ChatDefault) {
      final chatState = state as ChatDefault;
      final chatList = List.of(chatState.chatText);
      chatList.add(
        ChatText(
          isSender: true,
          bubbleContent: chatState.messageController.text,
          textTime: DateTime.now(),
        ),
      );

      emit(
        ChatDefault(
          chatText: chatList,
          messageController: TextEditingController(),
        ),
      );
    }
  }

  FutureOr<void> _giveMeData(GiveMeData event, emit) async {
    if (state is ChatInitial) {
      final chatList = [
        ChatText(
          isSender: true,
          bubbleContent: "Hey, how are you doing",
          textTime: DateTime.now(),
        ),
        ChatText(
          isSender: false,
          bubbleContent: "Hey, how are you doing",
          textTime: DateTime.now(),
        ),
        ChatText(
          isSender: false,
          bubbleContent: "Hey, how are you doing",
          textTime: DateTime.now(),
        ),
        ChatText(
          isSender: true,
          bubbleContent: "Hey, how are you doing",
          textTime: DateTime.now(),
        ),
        ChatText(
          isSender: false,
          bubbleContent: "Hey, how are you doing",
          textTime: DateTime.now(),
        ),
        ChatText(
          isSender: true,
          bubbleContent: "Hey, how are you doing",
          textTime: DateTime.now(),
        ),
        ChatText(
          isSender: true,
          bubbleContent: "Hey, how are you doing",
          textTime: DateTime.now(),
        ),
      ];
      emit(ChatLoading());
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final prevAcceptedForm = prefs.getString(event.id);

      debugPrint(prevAcceptedForm);
      if (prevAcceptedForm == null) {
        emit(ChatNotice());
        return;
      }
      emit(ChatDefault(
        messageController: TextEditingController(),
        chatText: chatList,
      ));
    }
  }

  FutureOr<void> _acceptChatNotice(AcceptChatNotice event, emit) async {
    if (state is ChatNotice) {
      // maybe there is some backend service to check if the user accepted a notice.

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(event.id, 'commmunicating');
      emit(
        ChatDefault(
          messageController: TextEditingController(),
          chatText: const [],
        ),
      );
    }
  }
}
