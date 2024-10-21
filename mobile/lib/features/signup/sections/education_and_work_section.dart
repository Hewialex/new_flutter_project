import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/widgets/custom_dropdown_menu.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';

class EducationAndWorkSection extends StatelessWidget {
  const EducationAndWorkSection({
    super.key,
    required this.nationality,
  });

  final List<String> nationality;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Education and Work',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 25.h),
        CustomDropdownMenu(
          values: nationality,
          value: "",
          onChanged: (value) {},
          hintText: "Financial Status",
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: nationality,
          value: "",
          onChanged: (value) {},
          hintText: "Financial Status",
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: nationality,
          value: "",
          onChanged: (value) {},
          hintText: "Job Category",
        ),
        SizedBox(height: 20.h),
        const CustomTextField(text: 'Job'),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: nationality,
          value: "",
          onChanged: (value) {},
          hintText: "Monthly Income",
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: nationality,
          value: "",
          onChanged: (value) {},
          hintText: "Health Case",
        ),
      ],
    );
  }
}
