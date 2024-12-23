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
    on<ReceiveText>(_receiveText);
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
          bubbleContent: "Hey! How's it going?",
          textTime: DateTime.now().subtract(const Duration(minutes: 5)),
        ),
        ChatText(
          isSender: false,
          bubbleContent: "Not bad! Just finished a project. How about you?",
          textTime: DateTime.now().subtract(const Duration(minutes: 4)),
        ),
        ChatText(
          isSender: true,
          bubbleContent:
              "Nice! I'm just chilling, thinking about my next task.",
          textTime: DateTime.now().subtract(const Duration(minutes: 3)),
        ),
        ChatText(
          isSender: false,
          bubbleContent: "Sounds good. Any plans for the weekend?",
          textTime: DateTime.now().subtract(const Duration(minutes: 2)),
        ),
        ChatText(
          isSender: true,
          bubbleContent: "Might catch up on some reading. You?",
          textTime: DateTime.now().subtract(const Duration(minutes: 1)),
        ),
        ChatText(
          isSender: false,
          bubbleContent: "Probably going for a hike. Need some fresh air!",
          textTime: DateTime.now().subtract(const Duration(seconds: 45)),
        ),
        ChatText(
          isSender: true,
          bubbleContent: "That sounds awesome! Enjoy the hike!",
          textTime: DateTime.now().subtract(const Duration(seconds: 20)),
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

  FutureOr<void> _receiveText(event, emit) {
    if (state is ChatDefault) {
      final chatState = state as ChatDefault;
      final updateTextList = List.of(chatState.chatText);
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
