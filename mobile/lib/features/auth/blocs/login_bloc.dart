import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qismati/constants.dart';
import 'package:qismati/core/database/database_helper.dart';
import 'package:qismati/core/websocket/websocket.dart';
import 'package:qismati/features/notification/bloc/notification_bloc.dart';
import 'package:qismati/features/notification/model/notification_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final DatabaseHelper databaseHelper;
  final WebsocketService websocketService;
  final NotificationBloc notificationBloc;
  LoginBloc({
    required this.notificationBloc,
    required this.websocketService,
    required this.databaseHelper,
  }) : super(
          LoginDefault(
            emailController: TextEditingController(),
            passwordController: TextEditingController(),
          ),
        ) {
    on<AttemptLogin>(_attemptLogin);
    on<LoginReset>(_resetLogin);
  }

  FutureOr<void> _attemptLogin(event, emit) async {
    // check if token exists
    final storedToken = await databaseHelper.getToken();

    if (storedToken != null) {
      const url = "${Constants.baseUrl}/auth/me";
      final res = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer $storedToken",
        },
      );

      if (res.statusCode == 200) {
        //user already exists
        emit(LoginSuccess());
        return;
      }
    }

    const url = "${Constants.baseUrl}/auth/login";
    if (state is LoginDefault) {
      final prevLoginState = state as LoginDefault;

      emit(LoginVerification());
      final Map<String, dynamic> rawData = {
        "email": prevLoginState.emailController.text,
        "password": prevLoginState.passwordController.text,
      };
      final jsonData = jsonEncode(rawData);

      final res = await http.post(
        Uri.parse(url),
        body: jsonData,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (res.statusCode == 200) {
        debugPrint("User ${prevLoginState.emailController.text} has logged in");
        final bodyResponse = jsonDecode(res.body);
        debugPrint("Resposnse is $bodyResponse");

        final token = bodyResponse["data"]["token"];

        await databaseHelper.saveToken(token);
        await websocketService.connect(Constants.simpleUrl, token);
        websocketService.startListening((message) {
          debugPrint("WebSocket message received: $message");
          try {
            final json = jsonDecode(message);
            if (json["type"] == "notification"){
              final notification = NotificationModel.fromJson(json);
              notificationBloc.add(NotificationReceived(notification));
            } else if (json["type"] == "message") {
              final message = json["data"];
              debugPrint("Message Chat: $message");
            }
          } catch (e) {
            debugPrint("[X] WebSocket message parsing error: $e");
          }
        });

        debugPrint("token is $token");

        emit(LoginSuccess());
      } else {
        debugPrint("Couldn't login in status code: ${res.statusCode}");
        debugPrint("Couldn't login in data: ${res.body}");

        final json = jsonDecode(res.body);
        final String message = json["message"];

        emit(
          LoginDefault(
            emailController: prevLoginState.emailController,
            passwordController: prevLoginState.passwordController,
            err: _mapErrorCodeToLoginErr('wrong-password'),
            errorMessage: message,
          ),
        );
      }
    }
  }

  FutureOr<void> _resetLogin(event, emit) async {
    final prevLoginState = state as LoginDefault;
    emit(
      LoginDefault(
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        err: LoginErr.none,
      ),
    );
    prevLoginState.dispose();
  }

  // map error code to error LoginErr
  LoginErr _mapErrorCodeToLoginErr(String code) {
    switch (code) {
      case 'user-not-found':
        return LoginErr.userNotFound;
      case 'wrong-password':
        return LoginErr.input;
      default:
        return LoginErr.network;
    }
  }
}
