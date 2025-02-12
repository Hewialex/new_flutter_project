import 'package:flutter/cupertino.dart';
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
import 'package:qismati/core/database/database_helper.dart';
import 'package:qismati/core/utils/form_filed_validations/email_validation.dart';
import 'package:qismati/core/utils/form_filed_validations/password_validation.dart';
import 'package:qismati/core/websocket/websocket.dart';
import 'package:qismati/features/auth/blocs/login_bloc.dart';
import 'package:qismati/features/auth/blocs/password_visibility_cubit.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/features/chat/bloc/chat_bloc.dart';
import 'package:qismati/features/notification/bloc/notification_bloc.dart';
import 'package:qismati/routes.dart';
import 'package:qismati/generated/l10n.dart';

class LoginWithPasswordScreen extends StatelessWidget {
  const LoginWithPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(
        databaseHelper: DatabaseHelper(),
        websocketService: WebsocketService(),
        notificationBloc: context.read<NotificationBloc>(),
        chatBloc: context.read<ChatBloc>(),
      )..add(LoginReset()),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          debugPrint(state.toString());

          switch (state) {
            case LoginVerification():
              return const Scaffold(
                body: Center(
                  child: CupertinoActivityIndicator(
                    color: CustomColors.primary,
                  ),
                ),
              );
            case LoginSuccess():
              Future.microtask(() {
                if (context.mounted) {
                  context.go(Routes.home);
                }
              });
              return const Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.done,
                        color: CustomColors.chatName,
                        size: 50,
                      ),

                      // a success message
                      Text(
                        "Login successful",
                        style: TextStyle(
                          color: CustomColors.success,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            case LoginDefault():
              Future.microtask(() {
                if (context.mounted && state.err != null) {
                  CustomSnackBar(
                    context: context,
                    message: state.errorMessage!,
                    type: SnackBarType.error,
                  ).showSnack();
                }
              });
              return Scaffold(
                backgroundColor: CustomColors.background,
                body: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.h),
                    child: SingleChildScrollView(
                      child: ContentContainer(
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CustomTopBar(
                                altRoute: Routes.register,
                                excludeLangDropDown: true,
                              ),
                              SizedBox(height: 47.h),
                              CustomHeader(text: S.of(context).signIn),
                              Text(
                                // S.of(context).enterPassword,
                                'Please enter your email and password',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                ),
                              ),
                              SizedBox(height: 95.h),
                              CustomTextField(
                                text: S.of(context).email,
                                controller: state.emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: validateEmail,
                              ),
                              SizedBox(height: 29.h),
                              BlocBuilder<PasswordVisibilityCubit, bool>(
                                builder: (context, cubitState) {
                                  return CustomTextField(
                                    controller: state.passwordController,
                                    text: S.of(context).password,
                                    maxChar: 32,
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
                                    validator: validatePassword,
                                  );
                                },
                              ),
                              SizedBox(height: 25.h),
                              Container(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    context.push(Routes.forgotPassword);
                                  },
                                  child: Text(
                                    S.of(context).forgotPassword,
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
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    BlocProvider.of<LoginBloc>(context)
                                        .add((AttemptLogin()));
                                  }
                                },
                                text: S.of(context).signIn,
                                shadowColor: CustomColors.shadowBlue,
                                elevation: 5,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(height: 30.h),
                              Column(
                                children: [
                                  Text(
                                    S.of(context).dontHaveAccount,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: CustomColors.textBlack,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      final DatabaseHelper databaseHelper =
                                          RepositoryProvider.of<DatabaseHelper>(
                                              context);
                                      final gender =
                                          await databaseHelper.getGender();

                                      if (context.mounted) {
                                        context.push(Routes.signup,
                                            extra: gender);
                                      }
                                    },
                                    child: Text(
                                      S.of(context).signUp,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: CustomColors.primary,
                                        decoration: TextDecoration.underline,
                                        decorationColor: CustomColors
                                            .primary, // Add this line
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            default:
              return Scaffold(
                body: Center(
                  child: Text(S.of(context).unimplementedState),
                ),
              );
          }
        },
      ),
    );
  }
}
