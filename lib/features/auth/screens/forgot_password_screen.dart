import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/models/otp_nav_model.dart';
import 'package:qismati/common/widgets/custom_alert_dialog.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_header.dart';
import 'package:qismati/common/widgets/custom_snackbar.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/core/utils/form_filed_validations/email_validation.dart';
import 'package:qismati/features/auth/blocs/forgot_password_bloc/bloc/forgot_password_bloc.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/routes.dart';
import 'package:qismati/generated/l10n.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => ForgotPasswordBloc(),
      child: Scaffold(
        backgroundColor: CustomColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: ContentContainer(
              child: Column(
                children: [
                  const CustomTopBar(
                    altRoute: Routes.loginWithPassword,
                    excludeLangDropDown: true,
                  ),
                  SizedBox(height: 47.h),
                  CustomHeader(text: S.of(context).forgotPassword),
                  SizedBox(height: 93.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        // S.of(context).email,
                        'Enter your Email.',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 19.h),
                  Form(
                    key: formKey,
                    child: CustomTextField(
                      text: S.of(context).email,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: validateEmail,
                    ),
                  ),
                  SizedBox(height: 51.h),
                  BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                    listener: (context, state) {
                      if (state is ForgotPasswordSuccess ||
                          state is ForgotPasswordFailure) {
                        String message = '';
                        if (state is ForgotPasswordSuccess) {
                          message = (state).message;
                        } else if (state is ForgotPasswordFailure) {
                          message = (state).message;
                        }

                        CustomSnackBar(
                          context: context,
                          message: message,
                          type: SnackBarType
                              .error, // Adjust this based on the state type (success or failure)
                        ).showSnack();
                      }

                      if (state is ForgotPasswordSuccess) {
                        CustomAlertDialog.show(
                          context,
                          title: S.of(context).code_sent,
                          actions: [
                            CustomButton(
                              onPressed: () {
                                context.push(Routes.emailVerificationOtp,
                                    extra: OtpNavModel(
                                        isFromSignUp: false,
                                        isFromForgtenPassword: true,
                                        email: _emailController.text,
                                        otp: state.otp));
                              },
                              text: S.of(context).enter_code,
                              isLoading: state is ForgotPasswordLoading,
                              fontWeight: FontWeight.w600,
                              shadowColor: CustomColors.shadowBlue,
                            ),
                          ],
                        );
                      }
                    },
                    builder: (context, state) {
                      return CustomButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // draw an alert dialog if code is sent successfully to email.
                          }
                        },
                        text: S.of(context).send,
                        fontWeight: FontWeight.w600,
                        shadowColor: CustomColors.shadowBlue,
                      );
                    },
                  ),
                  SizedBox(height: 30.h),
                  CustomButton(
                    isInverted: true,
                    onPressed: () => context.push(Routes.loginWithPassword),
                    text: S.of(context).goToHome,
                    fontWeight: FontWeight.w600,
                    shadowColor: CustomColors.shadowBlue,
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
