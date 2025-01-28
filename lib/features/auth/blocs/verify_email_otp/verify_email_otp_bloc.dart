import 'package:dio/dio.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qismati/constants.dart';
import 'package:qismati/core/database/database_helper.dart';

part 'verify_email_otp_event.dart';
part 'verify_email_otp_state.dart';

class VerifyEmailOtpBloc
    extends Bloc<VerifyEmailOtpEvent, VerifyEmailOtpState> {
  final DatabaseHelper databaseHelper;
  VerifyEmailOtpBloc({required this.databaseHelper})
      : super(VerifyEmailOtpInitial()) {
    on<VerifyEmailOtpRequestEvent>(_onVerifyEmailOtp);
  }

  Future<void> _onVerifyEmailOtp(
    VerifyEmailOtpRequestEvent event,
    Emitter<VerifyEmailOtpState> emit,
  ) async {
    print('-----------------------loading---------------------');
    emit(VerifyEmailOtpLoading());
    final dio = Dio();
    const url = "${Constants.baseUrl}/auth/verifyemail";

    try {
      final res = await dio.post(
        url,
        data: {
          "email": event.email,
          "code": event.otp,
        },
      );

      final body = res.data;
      if (res.statusCode == 200 || res.statusCode == 201) {
        final token = body["token"];

        await databaseHelper.saveToken(token);

        emit(VerifyEmailOtpSuccess(message: body["message"]));
      } else {
        emit(const VerifyEmailOtpFailure(errorMessage: 'Failed to send OTP'));
      }
    } on DioException catch (e) {
      print('-------------------error------------------');
      print(e);
      emit(const VerifyEmailOtpFailure(
          errorMessage: ('failed to verify your code.')));
    }
  }
}
