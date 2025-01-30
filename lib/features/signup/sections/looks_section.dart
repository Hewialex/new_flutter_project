import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/widgets/custom_dropdown_menu.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/features/signup/utils/signup_dropdown_values.dart';
import 'package:qismati/generated/l10n.dart';

class LooksSection extends StatelessWidget {
  const LooksSection({
    super.key,
    required this.weightController,
    required this.heightController,
    required this.skinColorController,
    required this.bodyShapeController,
  });

  final TextEditingController weightController;
  final TextEditingController heightController;
  final TextEditingController skinColorController;
  final TextEditingController bodyShapeController;

  @override
  Widget build(BuildContext context) {
    final localizations = S.of(context);
    return Column(
      children: [
        Text(
          localizations.your_look,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 25.h),
        CustomTextField(
          text: "${localizations.weight}-kg",
          controller: weightController,
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 25.h),
        CustomTextField(
          text: "${localizations.height}-cm",
          controller: heightController,
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 25.h),
        CustomDropdownMenu(
          values: skinColorDropdownValues,
          controller: skinColorController,
          hintText: localizations.skin_color,
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: bodyShapeDropdownValues,
          controller: bodyShapeController,
          hintText: localizations.body_shape,
        ),
      ],
    );
  }
}
