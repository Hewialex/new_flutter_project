import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/features/signup/widgets/description_text_field.dart';
import 'package:qismati/features/signup/widgets/text_field_info.dart';
import 'package:qismati/generated/l10n.dart';

class AboutYourPartnerSection extends StatelessWidget {
  const AboutYourPartnerSection({super.key, required this.aboutYourPartnerController});

  final TextEditingController aboutYourPartnerController;

  @override
  Widget build(BuildContext context) {
    final localizations = S.of(context);
    return Column(
      children: [
        Text(
          localizations.about_your_partner,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 20.h),
        DescriptionTextField(
          controller: aboutYourPartnerController,
        ),
        SizedBox(height: 20.h),
        TextFieldInfo(
          info: localizations.about_your_partner_info,
        ),
      ],
    );
  }
}
