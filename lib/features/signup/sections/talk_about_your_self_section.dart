import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/features/signup/widgets/description_text_field.dart';
import 'package:qismati/features/signup/widgets/text_field_info.dart';
import 'package:qismati/generated/l10n.dart';

class TalkAboutYourSelfSection extends StatelessWidget {
  const TalkAboutYourSelfSection({super.key,
    required this.aboutYourSelfController,
  });

  final TextEditingController aboutYourSelfController;

  @override
  Widget build(BuildContext context) {
    final localizations = S.of(context);
    return Column(
      children: [
        Text(
          localizations.talk_about_yourself,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 20.h),

        DescriptionTextField(controller: aboutYourSelfController),

        SizedBox(height: 20.h),
        TextFieldInfo(
          info: localizations.talk_about_yourself_info,
        ),
      ],
    );
  }
}
