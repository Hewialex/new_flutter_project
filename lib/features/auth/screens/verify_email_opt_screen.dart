import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_header.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/common/widgets/pin_input_field.dart';
import 'package:qismati/features/auth/blocs/confirm_password_visibility_cubit.dart';
import 'package:qismati/features/auth/blocs/new_password_bloc/bloc/new_password_bloc.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/routes.dart';

class EmailVerificationOtpScreen extends StatelessWidget {
  const EmailVerificationOtpScreen({super.key});

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
                      const CustomTopBar(
                        altRoute: Routes.forgotPassword,
                        excludeLangDropDown: true,
                      ),
                      SizedBox(height: 47.h),
                      const CustomHeader(text: 'Verification'),
                      Text(
                        "Enter Verification Code",
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
                            "If you didn’t receive a code, ",
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
                              "Resend",
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
                        onPressed: () {
                          context.go(Routes.newPassword);
                        },
                        text: 'Verify',
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
