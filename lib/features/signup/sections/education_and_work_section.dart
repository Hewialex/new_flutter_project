import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/widgets/custom_dropdown_menu.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/features/signup/utils/signup_dropdown_values.dart';

class EducationAndWorkSection extends StatelessWidget {
  const EducationAndWorkSection({
    super.key,
    required this.nationality,
    required this.educationalQualificationController,
    required this.financialStatusController,
    required this.jobCategoryController,
    required this.jobController,
    required this.monthlyIncomeController,
    required this.healthCaseController,
  });

  final List<String> nationality;
  final TextEditingController educationalQualificationController;
  final TextEditingController financialStatusController;
  final TextEditingController jobCategoryController;
  final TextEditingController jobController;
  final TextEditingController monthlyIncomeController;
  final TextEditingController healthCaseController;

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
          values: educationalQualificationDropdownValues,
          controller: educationalQualificationController,
          hintText: "Educational Qualification",
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: financialStatusDropdownValues,
          controller: financialStatusController,
          hintText: "Financial Status",
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: jobCategoryDropdownValues,
          controller: jobCategoryController,
          hintText: "Job Category",
        ),
        SizedBox(height: 20.h),
        CustomTextField(
          text: 'Job',
          controller: jobController,
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: monthlyIncomeDropdownValues,
          controller: monthlyIncomeController,
          hintText: "Monthly Income",
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: healthCaseDropdownValues,
          controller: healthCaseController,
          hintText: "Health Case",
        ),
      ],
    );
  }
}
