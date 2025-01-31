import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/widgets/custom_dropdown_menu.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/features/signup/utils/signup_dropdown_values.dart';
import 'package:qismati/generated/l10n.dart';

class EducationAndWorkSection extends StatelessWidget {
  const EducationAndWorkSection({
    super.key,
    required this.educationalQualificationController,
    required this.financialStatusController,
    required this.jobCategoryController,
    required this.jobController,
    required this.monthlyIncomeController,
    required this.healthCaseController,
  });

  final TextEditingController educationalQualificationController;
  final TextEditingController financialStatusController;
  final TextEditingController jobCategoryController;
  final TextEditingController jobController;
  final TextEditingController monthlyIncomeController;
  final TextEditingController healthCaseController;

  @override
  Widget build(BuildContext context) {
    final localizations = S.of(context);
    return Column(
      children: [
        Text(
          localizations.education_and_work,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 25.h),
        CustomDropdownMenu(
          values: educationalQualificationDropdownValues,
          controller: educationalQualificationController,
          hintText: localizations.education_qualification,
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: financialStatusDropdownValues,
          controller: financialStatusController,
          hintText: localizations.financial_status,
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: jobCategoryDropdownValues,
          controller: jobCategoryController,
          hintText: localizations.job_category,
        ),
        SizedBox(height: 20.h),
        CustomTextField(
          text: localizations.job,
          controller: jobController,
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: monthlyIncomeDropdownValues,
          controller: monthlyIncomeController,
          hintText: localizations.monthly_income,
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: healthCaseDropdownValues,
          controller: healthCaseController,
          hintText: localizations.health_case,
        ),
      ],
    );
  }
}
