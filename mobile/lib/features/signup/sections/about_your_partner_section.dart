import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/features/signup/widgets/description_text_field.dart';
import 'package:qismati/features/signup/widgets/text_field_info.dart';

class AboutYourPartnerSection extends StatelessWidget {
  const AboutYourPartnerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'About Your Partner',
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
              'Please Provide a serious response . It is not permitted to include email addresses or phone number in this section .',
        ),
      ],
    );
  }
}
