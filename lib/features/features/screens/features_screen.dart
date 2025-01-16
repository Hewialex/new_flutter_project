import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/features/contactus/widgets/stylish_title.dart';
import 'package:qismati/generated/l10n.dart';

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ContentContainer(
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  const CustomTopBar(
                    excludeBackButton: false,
                    excludeLangDropDown: true,
                  ),
                  Text(
                    S.of(context).features,
                    style: GoogleFonts.kodchasan(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 26.h),
                  _buildFeatureListItem(
                    content: S.of(context).receiveMessage,
                    enable: true,
                  ),
                  _buildFeatureListItem(
                    content: S.of(context).sendMessageToAny,
                    enable: false,
                  ),
                  _buildFeatureListItem(
                    content: S.of(context).sendMessageToCountry,
                    enable: true,
                  ),
                  _buildFeatureListItem(
                    content: S.of(context).messageWhoFavorited,
                    enable: true,
                  ),
                  _buildFeatureListItem(
                    content: S.of(context).replyToMessage,
                    enable: true,
                  ),
                  _buildFeatureListItem(
                    content: S.of(context).controlMessaging,
                    enable: false,
                  ),
                  _buildFeatureListItem(
                    content: S.of(context).controlMessaging,
                    enable: true,
                  ),
                  _buildFeatureListItem(
                    content: S.of(context).removeAds,
                    enable: false,
                  ),
                  SizedBox(height: 26.h),
                  StyledTitle(title: S.of(context).premium),
                  SizedBox(height: 26.h),
                  Text(
                    S.of(context).premiumDescription,
                    style: GoogleFonts.kodchasan(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 26.h),
                  CustomButton(onPressed: () {}, text: S.of(context).subscribeNow),
                  SizedBox(height: 26.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureListItem(
      {required String content, required bool enable}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            enable ? Icons.check_circle : Icons.cancel,
            color: enable ? CustomColors.success : CustomColors.error,
            size: 30.sp,
          ),
          SizedBox(width: 10.w),
          Flexible(
            child: Text(
              content,
              style: GoogleFonts.kodchasan(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
