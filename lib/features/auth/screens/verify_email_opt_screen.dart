import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/models/otp_nav_model.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_header.dart';
import 'package:qismati/common/widgets/custom_snackbar.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/common/widgets/pin_input_field.dart';
import 'package:qismati/core/database/database_helper.dart';
import 'package:qismati/features/auth/blocs/verify_email_otp/verify_email_otp_bloc.dart';
import 'package:qismati/features/auth/cubit/resend_code/resendotp_cubit.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/routes.dart';
import 'package:qismati/generated/l10n.dart';

class EmailVerificationOtpScreen extends StatefulWidget {
  const EmailVerificationOtpScreen({
    super.key,
    required this.otpNavModel,
  });

  final OtpNavModel otpNavModel;

  @override
  State<EmailVerificationOtpScreen> createState() =>
      _EmailVerificationOtpScreenState();
}

class _EmailVerificationOtpScreenState
    extends State<EmailVerificationOtpScreen> {
  String? userPin;
  int _countdown = 60; // Countdown starting value (60 seconds)
  Timer? _timer; // Timer to handle countdown

  @override
  void initState() {
    super.initState();
    // Start countdown when the screen is displayed
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel timer when widget is disposed
    super.dispose();
  }

  // Function to start the countdown timer
  void _startCountdown() {
    if (_timer != null) {
      _timer?.cancel();
    }

    _countdown = 60; // Reset to 60 seconds
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
      } else {
        _timer?.cancel(); // Stop the timer when countdown finishes
      }
    });
  }

  // Function to handle OTP completion
  void onCompleteOtp(String otp) {
    setState(() {
      userPin = otp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 12.h),
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => VerifyEmailOtpBloc(
                    databaseHelper: DatabaseHelper(),
                  ),
                ),
                BlocProvider(
                  create: (context) => ResendotpCubit(),
                ),
              ],
              child: BlocConsumer<VerifyEmailOtpBloc, VerifyEmailOtpState>(
                listener: (context, state) async {
                  if (state is VerifyEmailOtpSuccess) {
                    CustomSnackBar(
                      context: context,
                      message: state.message,
                      type: SnackBarType.success,
                    ).showSnack();
                    if (widget.otpNavModel.isFromForgtenPassword) {
                      context.pushNamed(Routes.newPassword);
                    } else {
                      context.pushReplacementNamed(
                        Routes.signupAfterEmailVerificationScreen,
                      );
                    }
                  }
                  if (state is VerifyEmailOtpFailure) {
                    CustomSnackBar(
                      context: context,
                      message: state.errorMessage,
                      type: SnackBarType.error,
                    ).showSnack();
                  }
                },
                builder: (context, state) {
                  return ContentContainer(
                    child: Column(
                      children: [
                        CustomTopBar(
                          altRoute: widget.otpNavModel.isFromForgtenPassword
                              ? Routes.forgotPassword
                              : Routes.signup,
                          excludeLangDropDown: true,
                        ),
                        SizedBox(height: 47.h),
                        CustomHeader(text: S.of(context).verifyEmail),
                        Text(
                          S.of(context).enterVerificationCode,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(height: 95.h),
                        PinInputField(
                          onPressed: onCompleteOtp,
                        ),
                        SizedBox(height: 29.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S.of(context).didntReceiveCode,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                              ),
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            BlocConsumer<ResendotpCubit, ResendotpState>(
                              listener: (context, state) {
                                if (state is ResendotpFailure) {
                                  CustomSnackBar(
                                    context: context,
                                    message: state.errorMessage,
                                    type: SnackBarType
                                        .error, // Adjust this based on the state type (success or failure)
                                  ).showSnack();
                                }

                                if (state is ResendotpSuccess) {
                                  CustomSnackBar(
                                    context: context,
                                    message: state.message,
                                    type: SnackBarType
                                        .success, // Adjust this based on the state type (success or failure)
                                  ).showSnack();
                                }
                              },
                              builder: (context, state) {
                                return InkWell(
                                  onTap: _countdown == 0
                                      ? () async {
                                          await context
                                              .read<ResendotpCubit>()
                                              .resendCode(
                                                  widget.otpNavModel.email ??
                                                      '');
                                          _startCountdown();
                                        }
                                      : null,
                                  child: Text(
                                    _countdown == 0
                                        ? S.of(context).resendCode
                                        : 'Resend after $_countdown s',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: CustomColors.primary,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 29.h),
                        CustomButton(
                          onPressed: userPin != null
                              ? () {
                                  // Dispatch the VerifyEmailOtpRequestEvent with the required parameters
                                  context
                                      .read<VerifyEmailOtpBloc>()
                                      .add(VerifyEmailOtpRequestEvent(
                                        otp: userPin!,
                                        email: widget.otpNavModel.email ?? '',
                                        isForgotPassword: widget.otpNavModel
                                                .isFromForgtenPassword
                                            ? true
                                            : false,
                                      ));
                                }
                              : () async {},
                          isLoading: state is VerifyEmailOtpLoading,
                          text: S.of(context).verifyEmail,
                          shadowColor: CustomColors.shadowBlue,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 100.h)
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
