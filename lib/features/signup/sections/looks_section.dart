import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/widgets/custom_dropdown_menu.dart';
import 'package:qismati/features/signup/utils/signup_dropdown_values.dart';

class LooksSection extends StatelessWidget {
  const LooksSection({
    super.key,
    required this.nationality,
    required this.weightController,
    required this.heightController,
    required this.skinColorController,
    required this.bodyShapeController,
  });

  final List<String> nationality;
  final TextEditingController weightController;
  final TextEditingController heightController;
  final TextEditingController skinColorController;
  final TextEditingController bodyShapeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Your Look',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 25.h),
        CustomDropdownMenu(
          values: nationality,
          controller: weightController,
          hintText: "Weight-kg",
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: nationality,
          controller: heightController,
          hintText: "Height-cm",
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: skinColorDropdownValues,
          controller: skinColorController,
          hintText: "Skin Color",
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: bodyShapeDropdownValues,
          controller: bodyShapeController,
          hintText: "Body Shape",
        ),
      ],
    );
  }
}
