import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_header.dart';
import 'package:qismati/common/widgets/custom_snackbar.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/features/auth/blocs/signup_bloc.dart';
import 'package:qismati/features/signup/sections/basic_section.dart';
import 'package:qismati/generated/l10n.dart';
import 'package:qismati/routes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({
    super.key,
    required this.gender,
  });

  final String gender;

  @override
  Widget build(BuildContext context) {
    final localizations = S.of(context);

    return BlocConsumer<SignupBloc, SignupState>(
      builder: (context, state) {
        switch (state) {
          case SignupLoading():
            return const Scaffold(
              body: Center(
                child: CupertinoActivityIndicator(
                  color: CustomColors.primary,
                ),
              ),
            );

          case SignupSuccess():
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.done,
                      color: CustomColors.chatName,
                      size: 50,
                    ),
                    Text(
                      localizations.signup_successful,
                      style: const TextStyle(
                        color: CustomColors.success,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );

          case SignupDefault():
            Future.microtask(() {
              if (context.mounted && state.errorMessage != null) {
                CustomSnackBar(
                  context: context,
                  message: state.errorMessage!,
                  type: SnackBarType.error,
                ).showSnack();
              }
            });
            // update the state's gender with the selected geneder
            state.genderController.text = gender;
            state.copyWith(genderController: state.genderController);
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: ContentContainer(
                    child: Column(
                      children: [
                        const CustomTopBar(
                          altRoute: Routes.loginWithPassword,
                          excludeLangDropDown: true,
                        ),
                        CustomHeader(text: localizations.create_account),
                        Text(
                          localizations.create_account_description,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(
                          height: 31.h,
                        ),
                        BasicSection(
                          state: state,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );

          default:
            return Scaffold(
              body: Center(
                child: Text(
                  '${localizations.unimplemented_state} ',
                ),
              ),
            );
        }
      },
      listener: (context, state) {
        if (state is SignupSuccess) {
          context.go(Routes.loginWithPassword);
          CustomSnackBar(
            context: context,
            message: localizations.signed_up_user_successfully,
            type: SnackBarType.success,
          );
        }
        if (state is SignupDefault && state.error != SignupError.none) {
          CustomSnackBar(
            context: context,
            message:
                '${localizations.could_not_signup_user} ${state.errorMessage}',
            type: SnackBarType.success,
          );
        }
      },
    );
  }
}
