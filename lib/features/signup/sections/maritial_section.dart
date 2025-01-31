import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/widgets/custom_dropdown_menu.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/features/signup/utils/signup_dropdown_values.dart';
import 'package:qismati/generated/l10n.dart';

class MaritialSection extends StatelessWidget {
  const MaritialSection({
    super.key,
    required this.maritialStatusController,
    required this.marriageTypeController,
    required this.ageController,
    required this.childrenController,
  });

  final TextEditingController maritialStatusController;
  final TextEditingController marriageTypeController;
  final TextEditingController ageController;
  final TextEditingController childrenController;

  @override
  Widget build(BuildContext context) {
    final localizations = S.of(context);
    return Column(
      children: [
        Text(
          localizations.marital_status,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 25.h),
        CustomDropdownMenu(
          values: maritalStatusDropdownValues,
          controller: maritialStatusController,
          hintText: localizations.status,
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: marriageTypeDropdownValues,
          controller: marriageTypeController,
          hintText: localizations.marriage_type,
        ),
        SizedBox(height: 20.h),
        CustomTextField(
          text: localizations.age,
          controller: ageController,
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 20.h),
        CustomTextField(
          text: localizations.children,
          controller: childrenController,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
