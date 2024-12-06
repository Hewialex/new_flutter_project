import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qismati/constants.dart';
import 'package:http/http.dart' as http;
import 'package:qismati/core/database/database_helper.dart';
import 'package:qismati/features/chat/models/chat_list_model.dart';

part 'chat_list_state.dart';
part 'chat_list_event.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final DatabaseHelper dbHelper;
  final String _baseUrl = "${Constants.baseUrl}/chatroom";

  ChatListBloc({required this.dbHelper}) : super(ChatListInitial()) {
    on<GetChatList>(_getChatList);
  }

  FutureOr<void> _getChatList(event, emit) async {
    final String? token = await dbHelper.getToken();
    if (token == null) {
      debugPrint('No token stored inside the database');
    }

    final res = await http
        .get(Uri.parse(_baseUrl), headers: {'Authorization': 'Bearer $token'});

    final body = jsonDecode(res.body);


    if (res.statusCode == 200) {
      debugPrint("Json data is ${body['data']['chatrooms']}");
      final List<dynamic> chatListRooms = body['data']['chatrooms'];
      final List<ChatListModel> chatList =
          chatListRooms.map((e) => ChatListModel.fromJson(e)).toList();

      debugPrint("Json data is $chatListRooms");
      debugPrint("Chat List is $chatList");
      emit(ChatListLoaded(chatListModel: chatList));
    } else {
      debugPrint("Json data is $body");
      final message = body['message'];
      emit(ChatListError(errorMessage: message));
    }
  }
}
