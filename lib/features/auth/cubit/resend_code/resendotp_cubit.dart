import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:qismati/constants.dart';
import 'package:qismati/core/error/global_exception.dart';

part 'resendotp_state.dart';

class ResendotpCubit extends Cubit<ResendotpState> {
  ResendotpCubit() : super(ResendotpInitial());
  final dio = Dio();

  Future<void> resendCode(String email) async {
    final sentData = jsonEncode({"email": email});

    try {
      final res = await dio.post(
        Constants.resend_otp_url,
        data: sentData,
        options: Options(headers: {
          "Content-Type": "application/json",
        }),
      );
      final bodyResponse = res.data;
      if (res.statusCode == 200) {
        emit(ResendotpSuccess(message: bodyResponse["message"]));
      } else {
        final body = res.data as Map<String, dynamic>;
        emit(
          ResendotpFailure(errorMessage: body["message"]),
        );
      }
    } catch (e) {
      emit(
        ResendotpFailure(errorMessage: ErrorMapper.mapError(e).message),
      );
    }
  }
}
