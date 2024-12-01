// ignore_for_file: depend_on_referenced_packages

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebsocketService {
  late IOWebSocketChannel channel;
  late String serverHostname;
  late String serverPort;

  void connect(serverHostname, serverPort) {
    this.serverHostname = serverHostname;
    this.serverPort = serverPort;
    channel =
        IOWebSocketChannel.connect('ws://$serverHostname:$serverPort/ws/chat');
  }

  void disconnectFromServer() {
    channel.sink.close(status.goingAway);
  }

  void send(String message) {
    channel.sink.add(message);
  }

  void startListening(void Function(dynamic message) onMessageRecieved) {
    channel.stream.listen(onMessageRecieved);
  }
}
