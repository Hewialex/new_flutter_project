import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/features/signup/widgets/description_text_field.dart';
import 'package:qismati/features/signup/widgets/text_field_info.dart';

class TalkAboutYourSelfSection extends StatelessWidget {
  const TalkAboutYourSelfSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Talk About Yourself',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 20.h),
        const DescriptionTextField(),
        SizedBox(height: 20.h),
        const TextFieldInfo(
          info:
              'The information in this section is for our use only and WILL NOT be shown to other members. Please enter it accurately and completely',
        ),
      ],
    );
  }
}
