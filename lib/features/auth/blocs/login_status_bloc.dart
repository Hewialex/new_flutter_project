import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qismati/constants.dart';
import 'package:qismati/core/database/database_helper.dart';
import 'package:http/http.dart' as http;
import 'package:qismati/core/websocket/websocket.dart';
import 'package:qismati/features/notification/bloc/notification_bloc.dart';
import 'package:qismati/features/notification/model/notification_model.dart';

part 'login_status_event.dart';
part 'login_status_state.dart';

class LoginStatusBloc extends Bloc<LoginStatusEvent, LoginStatusState> {
  final WebsocketService websocketService;
  final NotificationBloc notificationBloc;

  LoginStatusBloc({
    required this.notificationBloc,
    required this.websocketService,
  }) : super(LoginStatusInitial()) {
    on<LoginStatusCheck>(_checkLoginStatus);
  }

  FutureOr<void> _checkLoginStatus(event, emit) async {
    final DatabaseHelper databaseHelper = DatabaseHelper();
    final token = await databaseHelper.getToken();

    const String baseUrl = "${Constants.baseUrl}/auth/me";

    if (token == null) {
      emit(LoginStatusDefault());
    } else {
      await websocketService.connect(Constants.simpleUrl, token);
      final res = await http.get(Uri.parse(baseUrl), headers: {
        "Authorization": "Bearer $token",
      });
      
      websocketService.startListening((message) {
                try {
          final json = jsonDecode(message);
          final notification = NotificationModel.fromJson(json);
          notificationBloc.add(NotificationReceived(notification));
        } catch (e) {
          debugPrint("[X] WebSocket message parsing error: $e");
        }
      });

      if (res.statusCode == 200) {
        debugPrint("A user is already signed in going to home page");
        emit(LoginStatusSuccess());
      }
    }
  }
}
