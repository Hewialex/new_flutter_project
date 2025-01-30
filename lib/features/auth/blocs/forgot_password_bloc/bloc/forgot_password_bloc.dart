import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:qismati/constants.dart';
import 'package:qismati/core/error/global_exception.dart';

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

    final dio = Dio();
    final json = {"email": event.email};

    try {
      final res = await dio.post(
        Constants.forgot_password_url,
        data: json,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      final body = res.data as Map<String, dynamic>;

      if (res.statusCode == 200 || res.statusCode == 201) {
        emit(ForgotPasswordSuccess(
          message: body["message"].toString(),
        ));
      } else {
        emit(ForgotPasswordFailure(message: body["message"].toString()));
      }
    } catch (e) {
      emit(ForgotPasswordFailure(message: ErrorMapper.mapError(e).message));
    }
  }
}
