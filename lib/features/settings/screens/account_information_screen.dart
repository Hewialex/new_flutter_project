import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/features/contactus/widgets/stylish_title.dart';

class AccountInformationScreen extends StatelessWidget {
  const AccountInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
                  child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.w),
          child: Column(
            children: [
              const CustomTopBar(
                excludeLangDropDown: true,
              ),
              const StyledTitle(title: 'Account information'),
              SizedBox(height: 26.h),
              CustomButton(onPressed: () {}, text: 'Verify your email'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Text(
                    'Your ID',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.lexend(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        color: CustomColors.headingGray,
                      ),
                    ),
                  ),
                  SizedBox(height: 21.h),
                  CustomTextField(
                    text: '970239',
                    controller: TextEditingController(),
                    readOnly: true,
                  ),
                  SizedBox(height: 26.h),
                  Text(
                    'Using Qismati',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.lexend(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        color: CustomColors.headingGray,
                      ),
                    ),
                  ),
                  SizedBox(height: 21.h),
                  CustomTextField(
                    text: '3 months',
                    controller: TextEditingController(),
                    readOnly: true,
                  ),
                  SizedBox(height: 26.h),
                  Text(
                    'Your connect status',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.lexend(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        color: CustomColors.headingGray,
                      ),
                    ),
                  ),
                  SizedBox(height: 21.h),
                  CustomTextField(
                    text: 'Connected',
                    controller: TextEditingController(),
                    readOnly: true,
                  ),
                  SizedBox(height: 26.h),
                  Text(
                    'You can control who sends you messages',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.lexend(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        color: CustomColors.headingGray,
                      ),
                    ),
                  ),
                  SizedBox(height: 21.h),
                  CustomTextField(
                    text: 'Settings Page',
                    controller: TextEditingController(),
                    readOnly: true,
                  ),
                  SizedBox(height: 21.h),
                  Text(
                    'To see all features assigned to you in the app',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.lexend(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        color: CustomColors.headingGray,
                      ),
                    ),
                  ),
                  SizedBox(height: 21.h),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Click here",
                      style: TextStyle(color: CustomColors.primary, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
