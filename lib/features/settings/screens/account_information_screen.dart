import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/features/contactus/widgets/stylish_title.dart';
import 'package:qismati/generated/l10n.dart';

class AccountInformationScreen extends StatelessWidget {
  const AccountInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = S.of(context);
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
              StyledTitle(title: localizations.account_information),
              SizedBox(height: 26.h),
              CustomButton(onPressed: () {}, text: localizations.verify_email),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Text(
                    localizations.your_id,
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
                    text: localizations.id_value,
                    controller: TextEditingController(),
                    readOnly: true,
                  ),
                  SizedBox(height: 26.h),
                  Text(
                    localizations.using_qismati,
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
                    text: localizations.usage_duration,
                    controller: TextEditingController(),
                    readOnly: true,
                  ),
                  SizedBox(height: 26.h),
                  Text(
                    localizations.your_connect_status,
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
                    text: localizations.connect_status,
                    controller: TextEditingController(),
                    readOnly: true,
                  ),
                  SizedBox(height: 26.h),
                  Text(
                    localizations.control_messages,
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
                    text: localizations.settings_page,
                    controller: TextEditingController(),
                    readOnly: true,
                  ),
                  SizedBox(height: 21.h),
                  Text(
                    localizations.see_all_features,
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
                    child: Text(
                      localizations.click_here,
                      style: const TextStyle(color: CustomColors.primary, fontSize: 20),
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
