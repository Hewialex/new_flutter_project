import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qismati/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:qismati/features/auth/models/signup_before_verification_model.dart';

part 'request_otp_event.dart';
part 'request_otp_state.dart';

class RequestOtpBloc extends Bloc<RequestOtpEvent, RequestOtpState> {
  RequestOtpBloc() : super(RequestOtpInitial()) {
    on<RequestOtpThroughEmail>(_attemptPinRequest);
  }

  Future<void> _attemptPinRequest(
    RequestOtpThroughEmail event,
    Emitter<RequestOtpState> emit,
  ) async {
    emit(RequestOtpLoading());
    const url = "${Constants.baseUrl}/auth/signup";

    try {
      // final res = await http.post(
      //   Uri.parse(url),
      //   headers: {
      //     'Content-Type': 'application/json',
      //   },
      //   body: jsonEncode({
      //     event.signupBeforeVerificationModel.toMap(),
      //   }),
      // );

      // if (res.statusCode == 200 || res.statusCode == 201) {
      //   emit(RequestOtpSuccess(res.body));
      // } else {
      //   final json = jsonDecode(res.body);
      //   // final String message = json["message"];
      //   emit(const RequestOtpFailure('Failed to send OTP'));
      // }
      await Future.delayed(const Duration(seconds: 2));
      emit(const RequestOtpSuccess(otp: '1234'));
    } catch (e) {
      emit(RequestOtpFailure(e.toString()));
    }
  }
}
