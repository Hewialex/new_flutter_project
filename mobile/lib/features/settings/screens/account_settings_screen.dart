import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_option_tile.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';

class AccountSettingsScreen extends StatelessWidget {
  AccountSettingsScreen({super.key});

  final optionTextStyle = GoogleFonts.lexend(
    textStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: CustomColors.headingGray,
    ),
  );

  final titleTextStyle = GoogleFonts.lexend(
    textStyle: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: CustomColors.headingGray,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            child: Column(
              children: [
                const CustomTopBar(excludeLangDropDown: true),
                SizedBox(height: 5.h),
                _buildTitle('My Settings'),
                SizedBox(height: 30.h),

                // Language and Online Settings
                CustomOptionTile(title: "Language", onTap: () {}),
                _buildSwitchRow("Online", true, (isSelected) {}),

                SizedBox(height: 30.h),
                _buildTitle('Who can message you?'),
                SizedBox(height: 30.h),

                // Messaging Settings
                CustomOptionTile(title: "Nationality", onTap: () {}),
                SizedBox(height: 15.h),
                CustomOptionTile(title: "Countries", onTap: () {}),

                SizedBox(height: 30.h),
                _buildTitle('Notification Settings'),
                SizedBox(height: 30.h),

                // Notification Settings
                _buildSwitchRow("Who added me to their favorite list?", true, (isSelected) {}),
                _buildSwitchRow("My Profile Visits", true, (isSelected) {}),
                _buildSwitchRow("Who added me to the ignore list?", true, (isSelected) {}),
                _buildSwitchRow("New Messages", true, (isSelected) {}),
                _buildSwitchRow("Who allowed me to see their photos?", true, (isSelected) {}),
                _buildSwitchRow("Success Stories", true, (isSelected) {}),

                // Divider for section separation
                SizedBox(height: 35.h),
                const Divider(thickness: 2, color: CustomColors.primary),
                SizedBox(height: 35.h),

                // Ringtone & Vibration Settings
                _buildSwitchRow("Ringtone Alert", true, (isSelected) {}),
                _buildSwitchRow("Vibrate Alert", true, (isSelected) {}),
                _buildSwitchRow("Notify me when the app is off", true, (isSelected) {}),
                _buildSwitchRow("Receive notification on e-mail", true, (isSelected) {}),

                SizedBox(height: 30.h),
                _buildTitle('Font Settings'),
                SizedBox(height: 30.h),
                _buildSwitchRow("Increase font-size", true, (isSelected) {}),
                SizedBox(height: 65.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: titleTextStyle,
    );
  }

  Widget _buildSwitchRow(String title, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: optionTextStyle,
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: CustomColors.primary,
        ),
      ],
    );
  }
}
