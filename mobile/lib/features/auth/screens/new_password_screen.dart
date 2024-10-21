import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_header.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/routes.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 12.h),
              child: ContentContainer(
                child: Column(
                  children: [
                    const CustomTopBar(altRoute: Routes.forgotPassword),
                    SizedBox(height: 47.h),
                    const CustomHeader(text: 'New Password'),
                    Text(
                      "Enter new password",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 95.h),
                    const CustomTextField(
                      text: 'Enter new password',
                      obsecureText: true,
                    ),
                    SizedBox(height: 29.h),
                    const CustomTextField(
                      text: 'Confirm new password',
                      obsecureText: true,
                    ),
                    SizedBox(height: 75.h),
                    CustomButton(
                      onPressed: () {
                        context.go(Routes.login);
                      },
                      text: 'Change Password',
                      shadowColor: CustomColors.shadowBlue,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 100.h)
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
