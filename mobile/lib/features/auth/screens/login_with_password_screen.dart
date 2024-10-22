import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_header.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/features/auth/blocs/login_bloc.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginWithPasswordScreen extends StatelessWidget {
  const LoginWithPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    final formKey = GlobalKey<FormState>();

    return BlocConsumer<LoginBloc, LoginState>(builder: (context, state) {
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
          return const Scaffold();
        case LoginDefault():
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
                              bloc.add(AttemptLogin());
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
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            final gender = prefs.getString('gender');
                    
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
    }, listener: (context, state) {
      if (state is LoginSuccess) {
        context.go(Routes.home);
      }
    });
  }
}
