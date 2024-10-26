
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_dropdown_menu.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';

class QuickSearchSection extends StatelessWidget {
  const QuickSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          text: "Nationality",
          controller: TextEditingController(),
        ),
        SizedBox(height: 21.h),
        CustomTextField(
          text: "Country",
          controller: TextEditingController(),
        ),
        SizedBox(height: 21.h),
        Row(
          children: [
            const Text("Age"),
            SizedBox(width: 21.w),
            Flexible(
              child: SizedBox(
                width: double.infinity,
                child: CustomDropdownMenu(
                  values: List.generate(
                    90 - 18 + 1,
                    (index) => (18 + index).toString(),
                  ),
                  controller: TextEditingController(),
                  hintText: "From",
                ),
              ),
            ),
            SizedBox(width: 21.w),
            Flexible(
              child: SizedBox(
                width: double.infinity,
                child: CustomDropdownMenu(
                  values: List.generate(
                    90 - 18 + 1,
                    (index) => (18 + index).toString(),
                  ),
                  controller: TextEditingController(),
                  hintText: "To",
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 21.h),
        CustomDropdownMenu(
          values: const <String>["Married", "Single"],
          controller: TextEditingController(),
          hintText: "Marital Status",
        ),
        SizedBox(height: 21.h),
        CustomDropdownMenu(
          values: const <String>[ "Age"],
          controller: TextEditingController(),
          hintText: "Sort by",
        ),
        SizedBox(height: 40.h),
        CustomButton(
          onPressed: () async {},
          text: 'Search',
          shadowColor: CustomColors.shadowBlue,
          elevation: 5,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
