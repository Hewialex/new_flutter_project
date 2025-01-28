import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:qismati/constants.dart';
import 'package:qismati/features/auth/models/signup_before_verification_model.dart';

part 'request_otp_event.dart';
part 'request_otp_state.dart';

class RequestOtpBloc extends Bloc<RequestOtpEvent, RequestOtpState> {
  final Dio _dio = Dio();

  RequestOtpBloc() : super(RequestOtpInitial()) {
    on<RequestOtpThroughEmail>(_attemptPinRequest);
  }

  Future<void> _attemptPinRequest(
    RequestOtpThroughEmail event,
    Emitter<RequestOtpState> emit,
  ) async {
    emit(RequestOtpLoading());
    const url = "${Constants.baseUrl}/auth/signup";

    final sendData = event.signupBeforeVerificationModel.toMap();
    print('-----------------request data: $sendData');
    try {
      final response = await _dio.post(url, data: sendData);
      print("response data: ${response.data}");
      print("request data: $sendData");

      final body = response.data;
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(RequestOtpSuccess(otp: body["message"]));
      } else {
        emit(RequestOtpFailure(body["message"]));
      }
    } catch (e) {
      print('-----------------request data: $e');

      emit(const RequestOtpFailure('Something went wrong'));
    }
  }

  Future<bool> checkUsernameAvailability(String username) async {
    await Future.delayed(
        const Duration(seconds: 1)); // Simulating network delay
    return username != "takenUsername"; // Replace with actual backend logic
  }
}
