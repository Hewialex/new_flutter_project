import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_header.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/features/signup/sections/about_your_partner_section.dart';
import 'package:qismati/features/signup/sections/basic_section.dart';
import 'package:qismati/features/signup/sections/education_and_work_section.dart';
import 'package:qismati/features/signup/widgets/list_dot_item.dart';
import 'package:qismati/features/signup/sections/looks_section.dart';
import 'package:qismati/features/signup/sections/maritial_section.dart';
import 'package:qismati/features/signup/sections/religion_section.dart';
import 'package:qismati/features/signup/sections/talk_about_your_self_section.dart';
import 'package:qismati/routes.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({
    super.key,
    required this.gender,
  });

  final String gender;

  final List<String> nationality = [
    'Afghan',
    'Armenian',
    'Azerbaijani',
    'Bahraini',
    'Cypriot',
    'Egyptian',
    'Georgian',
    'Iranian',
    'Iraqi',
    'Israeli',
    'Jordanian',
    'Kuwaiti',
    'Lebanese',
    'Omani',
    'Palestinian',
    'Qatari',
    'Saudi',
    'Syrian',
    'Turkish',
    'Emirati',
    'Yemeni'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ContentContainer(
            child: Column(
              children: [
                const CustomTopBar(
                  altRoute: Routes.login,
                  excludeLangDropDown: true,
                ),
                const CustomHeader(text: 'Create Account'),
                CustomHeader(text: 'as $gender'),
                Text(
                  "Create an account so you can explore all App",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(
                  height: 31.h,
                ),
                BasicSection(nationality: nationality),
                SizedBox(height: 19.h),
                MaritialSection(nationality: nationality),
                SizedBox(height: 19.h),
                LooksSection(nationality: nationality),
                SizedBox(height: 19.h),
                ReligionSection(nationality: nationality),
                SizedBox(height: 19.h),
                EducationAndWorkSection(nationality: nationality),
                SizedBox(height: 19.h),
                const AboutYourPartnerSection(),
                SizedBox(height: 19.h),
                const TalkAboutYourSelfSection(),
                SizedBox(height: 19.h),
                Text(
                  'App Terms',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 19.h),
                const ListDotItem(
                    text: 'By clicking on sign up button, you agree to'),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Terms and Conditions',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: CustomColors.textRed,
                    ),
                  ),
                ),
                SizedBox(height: 54.h),
                CustomButton(
                  onPressed: () {
                    context.go(Routes.home);
                  },
                  text: 'Sign up',
                  shadowColor: CustomColors.shadowBlue,
                  elevation: 5,
                  fontWeight: FontWeight.w600,
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
