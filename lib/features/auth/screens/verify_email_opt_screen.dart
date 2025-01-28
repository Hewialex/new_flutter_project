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
import 'package:qismati/features/auth/blocs/signup_bloc.dart';
import 'package:qismati/features/auth/blocs/verify_email_otp/verify_email_otp_bloc.dart';
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
  // used to track the entered pin
  String? userPin;

  void onCompleteOtp(
    String otp,
  ) {
    setState(() {
      userPin = otp;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(
        '-------------------gender before ----------------${(context.read<SignupBloc>().state as SignupDefault).genderController.text}');

    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 12.h),
            child: BlocProvider(
              create: (context) =>
                  VerifyEmailOtpBloc(databaseHelper: DatabaseHelper()),
              child: BlocConsumer<VerifyEmailOtpBloc, VerifyEmailOtpState>(
                listener: (context, state) async {
                  if (state is VerifyEmailOtpSuccess) {
                    CustomSnackBar(
                      context: context,
                      message: state.message,
                      type: SnackBarType.success,
                    ).showSnack();
                    if (widget.otpNavModel.isFromForgtenPassword) {
                      context.go(Routes.newPassword);
                    } else {
                      context.pushReplacementNamed(
                        Routes.signupAfterEmailVerificationScreen,
                      );
                    }
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
                            InkWell(
                              onTap: () {
                                // TODO: add the resend logic here.
                              },
                              child: Text(
                                S.of(context).resendCode,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  color: CustomColors.primary,
                                ),
                              ),
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
