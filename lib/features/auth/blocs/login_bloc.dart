import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qismati/constants.dart';
import 'package:qismati/core/database/database_helper.dart';
import 'package:qismati/core/websocket/websocket.dart';
import 'package:qismati/features/chat/bloc/chat_bloc.dart';
import 'package:qismati/features/notification/bloc/notification_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final DatabaseHelper databaseHelper;
  final WebsocketService websocketService;
  final NotificationBloc notificationBloc;
  final ChatBloc chatBloc;
  LoginBloc({
    required this.notificationBloc,
    required this.websocketService,
    required this.databaseHelper,
    required this.chatBloc,
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
    // final storedToken = await databaseHelper.getToken();

    // if (storedToken != null) {
    //   emit(LoginVerification());
    //   const url = "${Constants.baseUrl}/auth/me";

    //   // Wrap the GET request with timeout
    //   final res = await Future.any([
    //     http.get(
    //       Uri.parse(url),
    //       headers: {
    //         "Authorization": "Bearer $storedToken",
    //       },
    //     ),
    //     Future.delayed(const Duration(seconds: 31),
    //         () => throw TimeoutException('Request timed out')),
    //   ]);

    //   if (res.statusCode == 200) {
    //     // user already exists
    //     emit(LoginSuccess());
    //     return;
    //   }
    // }

    // login
    const url = "${Constants.baseUrl}/auth/login";
    if (state is LoginDefault) {
      final prevLoginState = state as LoginDefault;
      emit(LoginVerification());

      final Map<String, dynamic> rawData = {
        "email": prevLoginState.emailController.text,
        "password": prevLoginState.passwordController.text,
      };

      final jsonData = jsonEncode(rawData);

      try {
        // Wrap the POST request with timeout
        final res = await Future.any([
          http.post(
            Uri.parse(url),
            body: jsonData,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
          ),
          Future.delayed(const Duration(seconds: 31),
              () => throw TimeoutException('Request timed out')),
        ]);
        print('------------------res----------------');
        print(res.body);
        if (res.statusCode == 200) {
          final bodyResponse = jsonDecode(res.body);
          final token = bodyResponse["data"]["token"];

          await databaseHelper.saveToken(token);
          // await websocketService.connect(Constants.simpleUrl, token);
          // websocketService.startListening((message) {
          //   try {
          //     final json = jsonDecode(message);
          //     if (json["type"] == "notification") {
          //       final notification = NotificationModel.fromJson(json);
          //       notificationBloc.add(NotificationReceived(notification));
          //     } else if (json["type"] == "message") {
          //       final message = json["data"];
          //       debugPrint("Message Chat: $message");
          //     }
          //   } catch (e) {
          //     debugPrint("[X] WebSocket message parsing error: $e");
          //   }
          // });

          emit(LoginSuccess());
        } else {
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
      } on TimeoutException catch (_) {
        debugPrint("Login request timed out");

        emit(
          LoginDefault(
            emailController: prevLoginState.emailController,
            passwordController: prevLoginState.passwordController,
            err: _mapErrorCodeToLoginErr('wrong-password'),
            errorMessage: 'The request timed out. Please try again later.',
          ),
        );
      } catch (e) {
        emit(
          LoginDefault(
            emailController: prevLoginState.emailController,
            passwordController: prevLoginState.passwordController,
            err: _mapErrorCodeToLoginErr('wrong-password'),
            errorMessage: 'Unexpected error. Please try again later.',
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
