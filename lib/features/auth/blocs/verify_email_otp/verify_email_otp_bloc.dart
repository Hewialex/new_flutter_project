import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qismati/constants.dart';
import 'package:http/http.dart' as http;

part 'verify_email_otp_event.dart';
part 'verify_email_otp_state.dart';

class VerifyEmailOtpBloc
    extends Bloc<VerifyEmailOtpEvent, VerifyEmailOtpState> {
  VerifyEmailOtpBloc() : super(VerifyEmailOtpInitial()) {
    on<VerifyEmailOtpRequestEvent>(_onVerifyEmailOtp);
  }

  Future<void> _onVerifyEmailOtp(
    VerifyEmailOtpRequestEvent event,
    Emitter<VerifyEmailOtpState> emit,
  ) async {
    print('-----------------------loading---------------------');
    emit(VerifyEmailOtpLoading());
    const url = "${Constants.baseUrl}/auth/verifyemail";

    try {
      // final res = await http.post(
      //   Uri.parse(url),
      //   headers: {
      //     'Content-Type': 'application/json',
      //   },
      //   body: jsonEncode({
      //     {
      //       "email": event.email,
      //       "code": event.otp,
      //     }
      //   }),
      // );

      // if (res.statusCode == 200 || res.statusCode == 201) {
      //   emit(VerifyEmailOtpSuccess(message: res.body.toString()));
      // } else {
      //   final json = jsonDecode(res.body);
      //   // final String message = json["message"];
      //   emit(const VerifyEmailOtpFailure(errorMessage: 'Failed to send OTP'));
      // }
      await Future.delayed(const Duration(seconds: 4));
      emit(const VerifyEmailOtpSuccess(message: 'success'));
    } catch (e) {
      emit(const VerifyEmailOtpFailure(
          errorMessage: ('failed to verify your code.')));
    }
  }
}
