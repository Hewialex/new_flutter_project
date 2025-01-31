import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/models/otp_nav_model.dart';
import 'package:qismati/common/widgets/custom_alert_dialog.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_dropdown_menu.dart';
import 'package:qismati/common/widgets/custom_snackbar.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/core/utils/debouncer.dart';
import 'package:qismati/core/utils/form_filed_validations/email_validation.dart';
import 'package:qismati/core/utils/form_filed_validations/password_validation.dart';
import 'package:qismati/core/utils/form_filed_validations/phonenumber_validator.dart';
import 'package:qismati/core/utils/form_filed_validations/username_validator.dart';
import 'package:qismati/features/auth/blocs/confirm_password_visibility_cubit.dart';
import 'package:qismati/features/auth/blocs/password_visibility_cubit.dart';
import 'package:qismati/features/auth/blocs/request_otp/bloc/request_otp_bloc.dart';
import 'package:qismati/features/auth/blocs/signup_bloc.dart';
import 'package:qismati/features/auth/cubit/username/username_cubit.dart';
import 'package:qismati/features/auth/models/signup_before_verification_model.dart';
import 'package:qismati/features/signup/widgets/phone_number_field.dart';
import 'package:qismati/features/signup/utils/signup_dropdown_values.dart';
import 'package:qismati/features/signup/widgets/text_field_info.dart';
import 'package:qismati/routes.dart';
import 'package:qismati/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BasicSection extends StatefulWidget {
  const BasicSection({
    super.key,
    required this.state,
  });

  final SignupDefault state;

  @override
  State<BasicSection> createState() => _BasicSectionState();
}

class _BasicSectionState extends State<BasicSection> {
  void onCountryCodeChanged(var value) {
    widget.state.copyWith(countryCode: value);
  }

  SignupBeforeVerificationModel convertToSignupModel(SignupDefault state) {
    return SignupBeforeVerificationModel(
      userName: state.userNameController.text,
      gender: state.genderController.text,
      phoneNumber: state.phoneNumberController.text,
      email: state.emailController.text,
      password: state.passwordController.text,
    );
  }

  final Debouncer _debouncer = Debouncer(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    // state.genderController.text = gender;
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
                controller: widget.state.userNameController,
                validator: validateUsername,
                maxChar: 15,
                onChanged: (value) {
                  _debouncer.run(() {
                    context
                        .read<UsernameCubit>()
                        .checkUsernameAvailability(value);
                  });
                },
              ),
              BlocBuilder<UsernameCubit, UsernameState>(
                builder: (context, state) {
                  if (state is UsernameLoading) {
                    return const SizedBox.shrink();
                  } else if (state is UsernameAvailable) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            state.message,
                            style:
                                const TextStyle(color: CustomColors.textGreen),
                          ),
                        ],
                      ),
                    );
                  } else if (state is UsernameTaken) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            state.message,
                            style: const TextStyle(color: CustomColors.textRed),
                          ),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
              SizedBox(height: 21.h),
              TextFieldInfo(
                info: localizations.username_info,
              ),
              SizedBox(height: 20.h),
              CustomDropdownMenu(
                values: genderDropdownValues,
                controller: widget.state.genderController,
                hintText: localizations.gender,
              ),
              SizedBox(height: 20.h),
              SizedBox(height: 20.h),
              PhoneNumberInput(
                onCountryCodeChanged: onCountryCodeChanged,
                phoneNumberController: widget.state.phoneNumberController,
                validator: validatePhoneNumber,
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                text: localizations.email,
                keyboardType: TextInputType.emailAddress,
                controller: widget.state.emailController,
                validator: validateEmail,
              ),
              SizedBox(height: 20.h),
              BlocBuilder<PasswordVisibilityCubit, bool>(
                builder: (context, cubitState) {
                  return CustomTextField(
                    controller: widget.state.passwordController,
                    maxChar: 32,
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
                    controller: widget.state.confirmPasswordController,
                    maxChar: 32,
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
        BlocConsumer<RequestOtpBloc, RequestOtpState>(
          listener: (context, otpState) async {
            if (otpState is RequestOtpSuccess) {
              // update the changed gender
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              final gender = widget.state.genderController.text;
              prefs.setString('gender', gender);

              // update the state with the selected gender
              widget.state
                  .copyWith(genderController: widget.state.genderController);

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
                          email: widget.state.emailController.text,
                          otp: otpState.otp,
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
            if (otpState is RequestOtpFailure) {
              CustomSnackBar(
                context: context,
                message: otpState.error,
                type: SnackBarType.error,
              ).showSnack();
            }
          },
          builder: (context, otpState) {
            return CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<RequestOtpBloc>().add(
                        RequestOtpThroughEmail(
                          signupBeforeVerificationModel:
                              convertToSignupModel(widget.state),
                        ),
                      );
                }
              },
              isLoading: otpState is RequestOtpLoading,
              text: localizations.confirm,
              fontWeight: FontWeight.w600,
              shadowColor: CustomColors.shadowBlue,
            );
          },
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
              onPressed: () {
                context.go(Routes.loginWithPassword);
              },
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
