import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_header.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/core/utils/form_filed_validations/password_validation.dart';
import 'package:qismati/features/auth/blocs/confirm_password_visibility_cubit.dart';
import 'package:qismati/features/auth/blocs/new_password_bloc/bloc/new_password_bloc.dart';
import 'package:qismati/features/auth/blocs/password_visibility_cubit.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/routes.dart';
import 'package:qismati/generated/l10n.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

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
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const CustomTopBar(
                          altRoute: Routes.forgotPassword,
                          excludeLangDropDown: true,
                        ),
                        SizedBox(height: 47.h),
                        CustomHeader(text: S.of(context).resetPassword),
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
                        CustomButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.go(Routes.loginWithPassword);
                            }
                          },
                          text: S.of(context).resetPassword,
                          shadowColor: CustomColors.shadowBlue,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 100.h)
                      ],
                    ),
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
