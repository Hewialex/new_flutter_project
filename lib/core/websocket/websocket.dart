// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qismati/features/notification/bloc/notification_bloc.dart';
import 'package:qismati/features/notification/model/notification_model.dart';
import 'package:web_socket_channel/io.dart';

class WebsocketService {
  late IOWebSocketChannel channel;
  late String serverHostname;
  late String serverPort;

  bool _isConnected = false;

  static WebsocketService? _instance;
  WebsocketService._internal();

  factory WebsocketService() {
    _instance ??= WebsocketService._internal();
    return _instance!;
  }

  Future<void> connect(String serverHostname, String token) async {
    if (_isConnected) {
      debugPrint(
        " [-]Connection already established. Disconnecting the existing connection.",
      );
      await disconnectFromServer();
    }

    try {
      this.serverHostname = serverHostname;
      channel = IOWebSocketChannel.connect('wss://$serverHostname', headers: {
        'access-token': token,
      });
      _isConnected = true;
      debugPrint(
          " [X]Connected to Websocket server at ws://$serverHostname/ws/chat");

    } catch (e) {
      debugPrint(" [X]Error connecting to Websocket server: $e");
    }
  }

  Future<void> disconnectFromServer() async {
    if (!_isConnected) {
      debugPrint(" [X]No active connection to disconnect.");
      return;
    }

    try {
      debugPrint(" [-]Closing Websocket connection...");
      await channel.sink.close(1000);
      _isConnected = false;
      debugPrint(" [X]Websocket connection closed.");
    } catch (e) {
      debugPrint(" [X]Error closing Websocket connection : $e");
    }
  }

  void send(String message) {
    channel.sink.add(message);
  }

  void startListening(void Function(dynamic message) onMessageRecieved) {
    channel.stream.listen(onMessageRecieved);
  }

  void setupWebSocket(
    BuildContext context,
  ) {
    final websocketService = WebsocketService();
    final NotificationBloc notificationBloc = context.read<NotificationBloc>();

    websocketService.startListening((message) {
      debugPrint("WebSocket message received: $message");

      try {
        final Map<String, dynamic> json = jsonDecode(message);
        final notification = NotificationModel.fromJson(json);
        notificationBloc.add(NotificationReceived(notification));
      } catch (e) {
        debugPrint("[X] Error processing WebSocket message: $e");
      }
    });
  }
}
