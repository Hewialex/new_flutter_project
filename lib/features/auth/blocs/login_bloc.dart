import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qismati/constants.dart';
import 'package:qismati/core/database/database_helper.dart';
import 'package:qismati/core/error/global_exception.dart';
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
    //     dio.get(
    //       url,
    //       options: Options(headers: {
    //         "Authorization": "Bearer $storedToken",
    //       }),
    //     ),
    //     Future.delayed(const Duration(seconds: 31),
    //         () => throw DioError(requestOptions: RequestOptions(path: url), type: DioErrorType.connectTimeout)),
    //   ]);

    //   if (res.statusCode == 200) {
    //     // user already exists
    //     emit(LoginSuccess());
    //     return;
    //   }
    // }

    // login
    if (state is LoginDefault) {
      final prevLoginState = state as LoginDefault;
      emit(LoginVerification());

      final Map<String, dynamic> rawData = {
        "email": prevLoginState.emailController.text,
        "password": prevLoginState.passwordController.text,
      };

      // message for success or failure
      String message = '';

      try {
        // Wrap the POST request with timeout
        final res = await dio.post(
          Constants.login_url,
          data: rawData,
          options: Options(headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }),
        );

        final bodyResponse = res.data;
        message = bodyResponse["message"];

        if (res.statusCode == 200) {
          final token = bodyResponse["data"]["token"];

          await databaseHelper.saveToken(token);

          //TODO: add websocket, UNCOMMENT

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
          emit(
            LoginDefault(
              emailController: prevLoginState.emailController,
              passwordController: prevLoginState.passwordController,
              err: _mapErrorCodeToLoginErr('wrong-password'),
              errorMessage: message,
            ),
          );
        }
      } catch (e) {
        emit(
          LoginDefault(
            emailController: prevLoginState.emailController,
            passwordController: prevLoginState.passwordController,
            err: _mapErrorCodeToLoginErr('wrong-password'),
            errorMessage: ErrorMapper.mapError(e).message,
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

final dio = Dio()..interceptors.add(LogInterceptor(responseBody: false));
