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
import 'package:qismati/core/websocket/websocket.dart';
import 'package:qismati/features/auth/blocs/login_bloc.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/features/notification/bloc/notification_bloc.dart';
import 'package:qismati/routes.dart';

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
                  child: SingleChildScrollView(
                    child: ContentContainer(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CustomTopBar(altRoute: Routes.register),
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
                            CustomTextField(
                              text: 'Email',
                              controller: state.emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 29.h),
                            CustomTextField(
                              controller: state.passwordController,
                              text: 'Password',
                              obsecureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  // TODO: Add more password validation here for a
                                  // better user experience
                                  return 'Please enter your password';
                                }
                                return null;
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
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<LoginBloc>(context)
                                      .add((AttemptLogin()));
                                }
                              },
                              text: 'Sign in',
                              shadowColor: CustomColors.shadowBlue,
                              elevation: 5,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 30.h),
                            TextButton(
                              onPressed: () async {
                                final DatabaseHelper databaseHelper =
                                    RepositoryProvider.of<DatabaseHelper>(
                                        context);
                                final gender = await databaseHelper.getGender();

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
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            default:
              return Scaffold(
                body: Center(
                  child: Text("Unimplemented state: $state"),
                ),
              );
          }
        },
      ),
    );
  }
}
