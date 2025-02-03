import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qismati/constants.dart';
import 'package:qismati/core/database/database_helper.dart';
import 'package:qismati/core/error/global_exception.dart';

part 'newpassword_state.dart';

class NewpasswordCubit extends Cubit<NewpasswordState> {
  NewpasswordCubit() : super(NewpasswordInitial());
  final dio = Dio();

  void sendnewPasswordRequest(Map<String, dynamic> newpasswordData) async {
    final sentData = jsonEncode(newpasswordData);

    emit(NewpasswordLoading());

    try {
      final String? token = await DatabaseHelper().getToken();
      final res = await dio.patch(
        Constants.reset_password_url,
        data: sentData,
        options: Options(
          headers: <String, String>{
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (res.statusCode == 200) {
        emit(const NewpasswordSuccess(message: 'success'));
      } else {
        final body = res.data as Map<String, dynamic>;
        emit(
          NewpasswordFailure(message: body["message"]),
        );
      }
    } catch (e) {
      debugPrint(
          '--------error mapper--------------${ErrorMapper.mapError(e).message}');
      emit(NewpasswordFailure(message: ErrorMapper.mapError(e).message));
    }
  }
}
