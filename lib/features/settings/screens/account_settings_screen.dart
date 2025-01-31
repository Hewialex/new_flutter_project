import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_option_tile.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/generated/l10n.dart';

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
    final localizations = S.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            child: Column(
              children: [
                const CustomTopBar(excludeLangDropDown: true),
                SizedBox(height: 5.h),
                _buildTitle(localizations.my_settings),
                SizedBox(height: 30.h),

                // Language and Online Settings
                CustomOptionTile(title: localizations.language, onTap: () {}),
                _buildSwitchRow(localizations.online, true, (isSelected) {}),

                SizedBox(height: 30.h),
                _buildTitle(localizations.who_can_message_you),
                SizedBox(height: 30.h),

                // Messaging Settings
                CustomOptionTile(title: localizations.nationality, onTap: () {}),
                SizedBox(height: 15.h),
                CustomOptionTile(title: localizations.countries, onTap: () {}),

                SizedBox(height: 30.h),
                _buildTitle(localizations.notification_settings),
                SizedBox(height: 30.h),

                // Notification Settings
                _buildSwitchRow(localizations.who_added_to_favorite, true, (isSelected) {}),
                _buildSwitchRow(localizations.my_profile_visits, true, (isSelected) {}),
                _buildSwitchRow(localizations.who_added_to_ignore, true, (isSelected) {}),
                _buildSwitchRow(localizations.new_messages, true, (isSelected) {}),
                _buildSwitchRow(localizations.who_allowed_see_photos, true, (isSelected) {}),
                _buildSwitchRow(localizations.success_stories, true, (isSelected) {}),

                // Divider for section separation
                SizedBox(height: 35.h),
                const Divider(thickness: 2, color: CustomColors.primary),
                SizedBox(height: 35.h),

                // Ringtone & Vibration Settings
                _buildSwitchRow(localizations.ringtone_alert, true, (isSelected) {}),
                _buildSwitchRow(localizations.vibrate_alert, true, (isSelected) {}),
                _buildSwitchRow(localizations.notify_when_app_off, true, (isSelected) {}),
                _buildSwitchRow(localizations.receive_email_notifications, true, (isSelected) {}),

                SizedBox(height: 30.h),
                _buildTitle(localizations.font_settings),
                SizedBox(height: 30.h),
                _buildSwitchRow(localizations.increase_font_size, true, (isSelected) {}),
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
