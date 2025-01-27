import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qismati/constants.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<RequestEmailVerification>(_requestEmailVerification);
  }

  Future<void> _requestEmailVerification(
    RequestEmailVerification event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(ForgotPasswordLoading());

    const url = "${Constants.baseUrl}/auth/forgotpassword";
    final json = {"email": event.email};

    final sentData = jsonEncode(json);

    try {
      // final res = await http.post(
      //   Uri.parse(url),
      //   headers: {
      //     'Content-Type': 'application/json',
      //   },
      //   body: sentData,
      // );
      // final body = jsonDecode(res.body) as Map<String, dynamic>;

      // if (res.statusCode == 200 || res.statusCode == 201) {
      //   emit(ForgotPasswordSuccess(
      //     message: body["message"].toString(),
      //     otp: body["otp"],
      //   ));
      // } else {
      //   emit(ForgotPasswordFailure(message: body["message"].toString()));
      // }

      await Future.delayed(const Duration(seconds: 4));
      emit(
        const ForgotPasswordSuccess(message: 'success', otp: '1234'),
      );
    } catch (e) {
      emit(const ForgotPasswordFailure(
          message: ('failed to verify your email.')));
    }
  }
}
