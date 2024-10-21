import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_header.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ContentContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomTopBar(altRoute: Routes.register),
                SizedBox(height: 47.h),
                const CustomHeader(text: "Login here"),
                Text(
                  "Welcome back you've been missed!",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 175.h),
                CustomButton(
                  onPressed: () {
                    context.push(Routes.loginWithPassword);
                  },
                  text: 'Sign in With Email',
                  shadowColor: CustomColors.shadowBlue,
                  elevation: 5,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 30.h),
                CustomButton(
                  onPressed: () {
                    //
                  },
                  text: 'Sign in Via Google',
                  shadowColor: CustomColors.shadowBlue,
                  elevation: 5,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 30.h),
                const Text("or"),
                SizedBox(height: 30.h),
                TextButton(
                  onPressed: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    final gender = prefs.getString('gender') ?? "Male";

                    if (context.mounted) {
                      context.push(Routes.signup, extra: gender);
                    }
                  },
                  child: Text(
                    "Create new account",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: CustomColors.textBlack,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
