import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/models/otp_nav_model.dart';
import 'package:qismati/common/widgets/custom_alert_dialog.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_dropdown_menu.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/core/utils/form_filed_validations/email_validation.dart';
import 'package:qismati/core/utils/form_filed_validations/fullName_validator.dart';
import 'package:qismati/core/utils/form_filed_validations/password_validation.dart';
import 'package:qismati/core/utils/form_filed_validations/phonenumber_validator.dart';
import 'package:qismati/core/utils/form_filed_validations/username_validator.dart';
import 'package:qismati/features/auth/blocs/confirm_password_visibility_cubit.dart';
import 'package:qismati/features/auth/blocs/password_visibility_cubit.dart';
import 'package:qismati/features/auth/blocs/signup_bloc.dart';
import 'package:qismati/features/signup/widgets/phone_number_field.dart';
import 'package:qismati/features/signup/utils/signup_dropdown_values.dart';
import 'package:qismati/features/signup/widgets/text_field_info.dart';
import 'package:qismati/routes.dart';
import 'package:qismati/generated/l10n.dart';

class BasicSection extends StatelessWidget {
  const BasicSection({
    super.key,
    required this.state,
  });

  final SignupDefault state;

  void onCountryCodeChanged(var value) {
    state.copyWith(countryCode: value);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = S.of(context);
    final formKey = GlobalKey<FormState>();
    return Column(
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                text: localizations.username,
                controller: state.userNameController,
                validator: validateUsername,
                maxChar: 15,
              ),
              SizedBox(height: 21.h),
              TextFieldInfo(
                info: localizations.username_info,
              ),
              SizedBox(height: 20.h),
              CustomDropdownMenu(
                values: genderDropdownValues,
                controller: state.genderController..text,
                hintText: localizations.gender,
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                text: localizations.full_name,
                controller: state.fullNameController,
                validator: validateFullName,
                maxChar: 50,
              ),
              SizedBox(height: 20.h),
              PhoneNumberInput(
                onCountryCodeChanged: onCountryCodeChanged,
                phoneNumberController: state.phoneNumberController,
                validator: validatePhoneNumber,
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                text: localizations.email,
                controller: state.emailController,
                validator: validateEmail,
              ),
              SizedBox(height: 20.h),
              BlocBuilder<PasswordVisibilityCubit, bool>(
                builder: (context, cubitState) {
                  return CustomTextField(
                    controller: state.passwordController,
                    maxChar: 6,
                    validator: validatePassword,
                    text: localizations.password,
                    suffix: IconButton(
                      icon: Icon(
                        cubitState ? Icons.visibility : Icons.visibility_off,
                        color: CustomColors.primary,
                      ),
                      onPressed: () => context
                          .read<PasswordVisibilityCubit>()
                          .togglePasswordVisibility(),
                    ),
                    obscureText: cubitState,
                  );
                },
              ),
              SizedBox(height: 29.h),
              BlocBuilder<ConfirmPasswordVisibilityCubit, bool>(
                builder: (context, confirmCubitState) {
                  return CustomTextField(
                    controller: state.confirmPasswordController,
                    maxChar: 6,
                    suffix: IconButton(
                      icon: Icon(
                        confirmCubitState
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: CustomColors.primary,
                      ),
                      onPressed: () => context
                          .read<ConfirmPasswordVisibilityCubit>()
                          .toggleConfirmPasswordVisibility(),
                    ),
                    obscureText: confirmCubitState,
                    validator: context.read<SignupBloc>().validateConfirmPw,
                    text: localizations.confirm_password,
                  );
                },
              ),
              TextFieldInfo(
                info: localizations.password_info,
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        CustomButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              // draw an alert dialog if code is sent successfully to email.
              CustomAlertDialog.show(
                context,
                title: localizations.code_sent,
                actions: [
                  CustomButton(
                    onPressed: () {
                      // remove the current dialog.
                      context.pop();
                      context.pushNamed(
                        Routes.emailVerificationOtp,
                        extra: OtpNavModel(
                          isFromSignUp: true,
                          isFromForgtenPassword: false,
                        ),
                      );
                    },
                    text: localizations.enter_code,
                    fontWeight: FontWeight.w600,
                    shadowColor: CustomColors.shadowBlue,
                  ),
                ],
              );
            }
          },
          text: localizations.confirm,
          fontWeight: FontWeight.w600,
          shadowColor: CustomColors.shadowBlue,
        ),
        SizedBox(height: 20.h),
        Column(
          children: [
            Text(
              "${localizations.account_exist}  ",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: CustomColors.textBlack,
              ),
            ),
            TextButton(
              onPressed: () => context.pushNamed(Routes.loginWithPassword),
              child: Text(
                localizations.login,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: CustomColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: CustomColors.primary, // Add this line
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
