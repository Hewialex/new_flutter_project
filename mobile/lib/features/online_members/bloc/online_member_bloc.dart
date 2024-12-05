import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qismati/common/models/profile.dart';
import 'package:qismati/constants.dart';
import 'package:http/http.dart' as http;
import 'package:qismati/core/database/database_helper.dart';

part 'online_member_event.dart';
part 'online_member_state.dart';

class OnlineMemberBloc extends Bloc<OnlineMemberEvent, OnlineMemberState> {
  final DatabaseHelper databaseHelper;
  OnlineMemberBloc({required this.databaseHelper}) : super(OnlineMemberInitial()) {
    on<FetchData>(_giveMeData);
    on<SelectOption>(_selectOption);
  }

  _giveMeData(event, emit) async {
    emit(OnlineMemberLoading());
    const baseUrl = "${Constants.baseUrl}/user/onlinemembers";

    final token = await databaseHelper.getToken();

    final res = await http.get(Uri.parse(baseUrl), headers: {
      "Authorization": "Bearer $token",
    });

    if (res.statusCode == 200) {
      final jsonData = jsonDecode(res.body) as Map<String, dynamic>;
      debugPrint("jsonData is $jsonData");

      final List<dynamic> jsonUsers = jsonData["data"]["users"];

      final List<ProfileModel> users =
          jsonUsers.map((e) => ProfileModel.fromJson(e)).toList();

      emit(OnlineMemberLoaded(users: users, error: OnlineMemberError.none));
    } else {
      emit(OnlineMemberLoaded(users: const [], error: OnlineMemberError.network));
    }
  }

  _selectOption(SelectOption event, emit) async {
    if (state is OnlineMemberLoaded) {
      final currState = state as OnlineMemberLoaded;
      const baseUrl = "${Constants.baseUrl}/user/";

      switch (event.option) {
        case "Like":
          final userList = List.of(currState.users);
          userList.removeAt(event.removedIndex);
          final token = await databaseHelper.getToken();

          final res = await http.post(
            Uri.parse("$baseUrl/like/${event.userId}"),
            headers: {
              "Authorization": "Bearer $token",
              'Content-Type': 'application/json; charset=UTF-8',
            },
          );

          if (res.statusCode == 200) {
            debugPrint(" [X]Successfully Liked a user");
            emit(OnlineMemberLoaded(users: userList, error: OnlineMemberError.none));
          } else {
            debugPrint(" [X]Could not remove the user properly");
            final jsonData = jsonDecode(res.body) as Map<String, dynamic>;
            debugPrint("Error message is ${jsonData['message']}");
            emit(
              OnlineMemberLoaded(users: userList, error: OnlineMemberError.server),
            );
          }
          break;

        case "Ignore":
          final userList = List.of(currState.users);
          userList.removeAt(event.removedIndex);
          final token = await databaseHelper.getToken();

          final res = await http.post(
            Uri.parse("$baseUrl/ignore/${event.userId}"),
            headers: {
              "Authorization": "Bearer $token",
              'Content-Type': 'application/json; charset=UTF-8',
            },
          );
              // body: jsonEncode({})

          if (res.statusCode == 200) {
            debugPrint(" [X]Successfully Ignored a user");
            emit(OnlineMemberLoaded(users: userList, error: OnlineMemberError.none));
          } else {
            debugPrint(" [X]Could not remove the user properly");
            final jsonData = jsonDecode(res.body) as Map<String, dynamic>;
            debugPrint("Error message is ${jsonData['message']}");
            emit(
              OnlineMemberLoaded(users: userList, error: OnlineMemberError.server),
            );
          }
          break;
      }
    }
  }
}
