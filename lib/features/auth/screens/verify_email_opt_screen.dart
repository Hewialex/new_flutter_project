// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:qismati/common/colors.dart';
import 'package:qismati/common/models/otp_nav_model.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_header.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/common/widgets/pin_input_field.dart';
import 'package:qismati/core/database/database_helper.dart';
import 'package:qismati/features/auth/blocs/new_password_bloc/bloc/new_password_bloc.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/routes.dart';
import 'package:qismati/generated/l10n.dart';

class EmailVerificationOtpScreen extends StatelessWidget {
  const EmailVerificationOtpScreen({
    super.key,
    required this.otpNavModel,
  });

  final OtpNavModel otpNavModel;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 12.h),
            child: BlocProvider(
              create: (context) => NewPasswordBloc(),
              child: BlocBuilder<NewPasswordBloc, NewPasswordState>(
                  builder: (context, state) {
                return ContentContainer(
                  child: Column(
                    children: [
                      CustomTopBar(
                        altRoute: otpNavModel.isFromForgtenPassword
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
                        onPressed: (value) {},
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
                        onPressed: () async {
                          if (otpNavModel.isFromForgtenPassword) {
                            context.go(Routes.newPassword);
                          } else {
                            final databaseHelper =
                                RepositoryProvider.of<DatabaseHelper>(context);
                            final gender = await databaseHelper.getGender();
                            context.pushReplacementNamed(
                              Routes.signupAfterEmailVerificationScreen,
                              extra: gender,
                            );
                          }
                        },
                        text: S.of(context).verifyEmail,
                        shadowColor: CustomColors.shadowBlue,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 100.h)
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
