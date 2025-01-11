import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_header.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/core/utils/form_filed_validations/email_validation.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/routes.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ContentContainer(
            child: Column(
              children: [
                const CustomTopBar(
                  altRoute: Routes.login,
                  excludeLangDropDown: true,
                ),
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
                Form(
                  key: formKey,
                  child: CustomTextField(
                    text: 'Email',
                    controller: TextEditingController(),
                    validator: validateEmail,
                  ),
                ),
                SizedBox(height: 51.h),
                CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.push(Routes.newPassword);
                    }
                  },
                  text: 'Send',
                  fontWeight: FontWeight.w600,
                  shadowColor: CustomColors.shadowBlue,
                ),
                SizedBox(height: 30.h),
                CustomButton(
                  isInverted: true,
                  onPressed: () => context.push(Routes.login),
                  text: 'Back to Login',
                  fontWeight: FontWeight.w600,
                  shadowColor: CustomColors.shadowBlue,
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
