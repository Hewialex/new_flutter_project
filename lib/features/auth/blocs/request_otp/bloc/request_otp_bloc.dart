import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qismati/constants.dart';
import 'package:http/http.dart' as http;
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

    final sendData = jsonEncode({
      "userName": event.signupBeforeVerificationModel.userName.toString(),
      "email": event.signupBeforeVerificationModel.email.toString(),
      "password": event.signupBeforeVerificationModel.password.toString(),
      "phoneNumber": event.signupBeforeVerificationModel.phoneNumber.toString(),
      "gender": event.signupBeforeVerificationModel.gender.toString()
    });

    try {
      final res = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: sendData,
      );

      print('----------------------sample-----------');

      print(res.body);
      print(jsonEncode(event.signupBeforeVerificationModel.toMap()));

      final body = jsonDecode(res.body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        emit(RequestOtpSuccess(otp: body["message"]));
      } else {
        // final String message = json["message"];
        emit(RequestOtpFailure(body["message"]));
      }
    } catch (e) {
      print('------------------error------------------');
      print(e.toString());
      emit(RequestOtpFailure(e.toString()));
    }
  }

  Future<bool> checkUsernameAvailability(String username) async {
    // Simulate a network request (replace with actual API call)
    await Future.delayed(
        const Duration(seconds: 1)); // Simulating network delay
    // Return true if username is available, false if already taken
    return username != "takenUsername"; // Replace with actual backend logic
  }
}
