import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qismati/constants.dart';
import 'package:qismati/core/utils/debouncer.dart';
import 'package:http/http.dart' as http;

part 'username_state.dart';

class UsernameCubit extends Cubit<UsernameState> {
  final Debouncer debouncer;
  UsernameCubit(this.debouncer) : super(UsernameInitial());

  void checkUsernameAvailability(String username) {
    if (username.isEmpty) {
      emit(UsernameLoading());
      return;
    }
    // Start the debouncing process
    debouncer.run(
      () async {
        const String url = "${Constants.baseUrl}/auth/validateUserName";

        final json = {"userName": username};

        final sentData = jsonEncode(json);

        final res = await http.post(
          Uri.parse(url),
          headers: <String, String>{
            "Content-Type": "application/json",
          },
          body: sentData,
        );

        if (res.statusCode == 200) {
          emit(UsernameAvailable(message: 'Username is available'));
        } else {
          final body = jsonDecode(res.body) as Map<String, dynamic>;
          emit(
            UsernameTaken(message: body["message"]),
          );
        }
      },
    );
  }
}
