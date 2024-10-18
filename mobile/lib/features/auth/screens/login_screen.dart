import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_header.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
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
                const CustomHeader(text: "Login here"),
                Text(
                  "Enter email and password",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 95.h),
                const CustomTextField(text: 'Email'),
                SizedBox(height: 29.h),
                const CustomTextField(text: 'Password', obsecureText: true),
                SizedBox(height: 25.h),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(
                        color: CustomColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                CustomButton(
                  onPressed: () {},
                  text: 'Sign in',
                  shadowColor: CustomColors.shadowBlue,
                  elevation: 5,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 30.h),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Create new account",
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
    );
  }
}
