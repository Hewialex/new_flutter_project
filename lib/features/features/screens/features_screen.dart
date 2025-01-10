
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/features/contactus/widgets/stylish_title.dart';

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
                    'Features',
                    style: GoogleFonts.kodchasan(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 26.h),
                  _buildFeatureListItem(
                    content: 'Receive message.',
                    enable: true,
                  ),
                  _buildFeatureListItem(
                    content: 'Send message to any member.',
                    enable: false,
                  ),
                  _buildFeatureListItem(
                    content: 'Send message to member from your country.',
                    enable: true,
                  ),
                  _buildFeatureListItem(
                    content: 'Message who added you to his favorite list.',
                    enable: true,
                  ),
                  _buildFeatureListItem(
                    content: 'Reply to message.',
                    enable: true,
                  ),
                  _buildFeatureListItem(
                    content: 'Control who can message you. ',
                    enable: false,
                  ),
                  _buildFeatureListItem(
                    content: 'Control who can message you. ',
                    enable: true,
                  ),
                  _buildFeatureListItem(
                    content: 'Remove add.',
                    enable: false,
                  ),
                  SizedBox(height: 26.h),
                  const StyledTitle(title: "Premium Package"),
                  SizedBox(height: 26.h),
                  Text(
                    '''By subscribing to the premium package, you will activate
                    all the available features and thus increase your efficiency
                     in the application to reach your goal faster .''',
                    style: GoogleFonts.kodchasan(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 26.h),
                  CustomButton(onPressed: () {}, text: 'Subscribe Now'),
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
