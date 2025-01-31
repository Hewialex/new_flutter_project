import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_header.dart';
import 'package:qismati/common/widgets/custom_snackbar.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/core/utils/form_filed_validations/password_validation.dart';
import 'package:qismati/features/auth/blocs/confirm_password_visibility_cubit.dart';
import 'package:qismati/features/auth/blocs/new_password_bloc/bloc/new_password_bloc.dart';
import 'package:qismati/features/auth/blocs/password_visibility_cubit.dart';
import 'package:qismati/features/auth/cubit/newpassword/newpassword_cubit.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/routes.dart';
import 'package:qismati/generated/l10n.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => NewpasswordCubit(),
      child: Scaffold(
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
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            const CustomTopBar(
                              altRoute: Routes.forgotPassword,
                              excludeLangDropDown: true,
                            ),
                            SizedBox(height: 47.h),
                            // CustomHeader(text: S.of(context).resetPassword),
                            const CustomHeader(text: 'New Password'),
                            Text(
                              S.of(context).enterPassword,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                              ),
                            ),
                            SizedBox(height: 95.h),
                            BlocBuilder<PasswordVisibilityCubit, bool>(
                              builder: (context, cubitState) {
                                return CustomTextField(
                                  controller: (state as NewPassWordInitial)
                                      .passwordController,
                                  validator: validatePassword,
                                  text: S.of(context).password,
                                  suffix: IconButton(
                                    icon: Icon(
                                      cubitState
                                          ? Icons.visibility
                                          : Icons.visibility_off,
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
                                  controller: (state as NewPassWordInitial)
                                      .confirmPasswordController,
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
                                  validator: context
                                      .read<NewPasswordBloc>()
                                      .validateConfirmPw,
                                  text: S.of(context).confirmPassword,
                                );
                              },
                            ),
                            SizedBox(height: 75.h),

                            BlocConsumer<NewpasswordCubit, NewpasswordState>(
                              listener: (context, newpasswordCubitstate) {
                                if (newpasswordCubitstate
                                    is NewpasswordFailure) {
                                  CustomSnackBar(
                                    context: context,
                                    message: newpasswordCubitstate.message,
                                    type: SnackBarType
                                        .error, // Adjust this based on the state type (success or failure)
                                  ).showSnack();
                                }

                                if (newpasswordCubitstate
                                    is NewpasswordSuccess) {
                                  context.go(Routes.loginWithPassword);

                                  CustomSnackBar(
                                    context: context,
                                    message: newpasswordCubitstate.message,
                                    type: SnackBarType
                                        .success, // Adjust this based on success
                                  ).showSnack();
                                }
                              },
                              builder: (context, newpasswordCubitstate) {
                                return CustomButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      final newpasswordData = {
                                        "resetPasswordToken": "Yj_nxsVnYdwcM",
                                        "newPassword":
                                            (state as NewPassWordInitial)
                                                .passwordController
                                                .text
                                      };

                                      // Ensure you're passing serializable data to the API call or cubit
                                      context
                                          .read<NewpasswordCubit>()
                                          .sendnewPasswordRequest(
                                              newpasswordData);
                                    }
                                  },
                                  isLoading: newpasswordCubitstate
                                      is NewpasswordLoading,
                                  text: S.of(context).resetPassword,
                                  shadowColor: CustomColors.shadowBlue,
                                  fontWeight: FontWeight.w600,
                                );
                              },
                            ),
                            SizedBox(height: 100.h)
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
