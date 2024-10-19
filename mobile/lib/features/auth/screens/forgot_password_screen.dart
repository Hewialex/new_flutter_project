import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_header.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 12.h),
              child: Container(
                width: 341.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.r),
                  ),
                ),
                child: Column(
                  children: [
                    const CustomTopBar(),
                    SizedBox(height: 47.h),
                    const CustomHeader(text: "Forgot your password"),
                    SizedBox(height: 93.h),
                    Text(
                      "Enter your Email",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 19.h),
                    const CustomTextField(text: 'Email'),
                    SizedBox(height: 51.h),
                    CustomButton(
                      onPressed: () {},
                      text: 'Send',
                      fontWeight: FontWeight.w600,
                      shadowColor: CustomColors.shadowBlue,
                    ),
                    SizedBox(height: 130.h),
                    TextButton(
                      onPressed: () {
                        context.go('/login');
                      },
                      child: Text(
                        "Back to sign in",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: CustomColors.textBlack,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
