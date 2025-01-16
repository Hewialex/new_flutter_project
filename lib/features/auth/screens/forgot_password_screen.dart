import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_alert_dialog.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_header.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/core/utils/form_filed_validations/email_validation.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/routes.dart';
import 'package:qismati/generated/l10n.dart';

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
                CustomHeader(text: S.of(context).forgotPassword),
                SizedBox(height: 93.h),
                Text(
                  S.of(context).email,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 19.h),
                Form(
                  key: formKey,
                  child: CustomTextField(
                    text: S.of(context).email,
                    controller: TextEditingController(),
                    validator: validateEmail,
                  ),
                ),
                SizedBox(height: 51.h),
                CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // draw an alert dialog if code is sent successfully to email.
                      CustomAlertDialog.show(
                        context,
                        title: S.of(context).code_sent,
                        actions: [
                          CustomButton(
                            onPressed: () {
                              context.push(Routes.emailVerificationOtp);
                            },
                            text: S.of(context).enter_code,
                            fontWeight: FontWeight.w600,
                            shadowColor: CustomColors.shadowBlue,
                          ),
                        ],
                      );
                    }
                  },
                  text: S.of(context).send,
                  fontWeight: FontWeight.w600,
                  shadowColor: CustomColors.shadowBlue,
                ),
                SizedBox(height: 30.h),
                CustomButton(
                  isInverted: true,
                  onPressed: () => context.push(Routes.login),
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
    );
  }
}
