

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_dropdown_menu.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/features/contactus/widgets/stylish_title.dart';

class AdvancedSearchSection extends StatelessWidget {
  const AdvancedSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Country & Nationality',
          style: GoogleFonts.lexend(
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              color: CustomColors.headingGray,
            ),
          ),
        ),
        SizedBox(height: 21.h),
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
        CustomTextField(
          text: "City",
          controller: TextEditingController(),
        ),
        SizedBox(height: 21.h),
        Text(
          'Physical preferences',
          style: GoogleFonts.lexend(
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              color: CustomColors.headingGray,
            ),
          ),
        ),
        SizedBox(height: 21.h),
        CustomDropdownMenu(
          values: const <String>["Married", "Single"],
          controller: TextEditingController(),
          hintText: "Marital Type",
        ),
        SizedBox(height: 21.h),
        CustomDropdownMenu(
          values: const <String>["Married", "Single"],
          controller: TextEditingController(),
          hintText: "Marital Status",
        ),
        SizedBox(height: 21.h),
        Row(
          children: [
            const Text("Height - cm"),
            SizedBox(width: 21.w),
            Flexible(
              child: SizedBox(
                width: double.infinity,
                child: CustomDropdownMenu(
                  values: List.generate(
                    200,
                    (index) => '${40 + index} cm',
                    growable: false
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
                    200,
                    (index) => '${40 + index} cm',
                    growable: false
                  ),
                  controller: TextEditingController(),
                  hintText: "To",
                ),
              ),
            )
          ],
        ),

        SizedBox(height: 21.h),
        Row(
          children: [
            const Text("Weight - kg"),
            SizedBox(width: 21.w),
            Flexible(
              child: SizedBox(
                width: double.infinity,
                child: CustomDropdownMenu(
                  values: List.generate(
                    200,
                    (index) => '${40 + index} kg',
                    growable: false
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
                    200,
                    (index) => '${40 + index} kg',
                    growable: false
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
          values: const <String>["Black", "Yellow", "White"],
          controller: TextEditingController(),
          hintText: "Skin Color",
        ),
        SizedBox(height: 21.h),
        Text(
          'Education Qualification',
          style: GoogleFonts.lexend(
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              color: CustomColors.headingGray,
            ),
          ),
        ),

        CustomDropdownMenu(
          values: const <String>["All", "Educated", "Not Educated"],
          controller: TextEditingController(),
          hintText: "",
        ),
        SizedBox(height: 21.h),
        const StyledTitle(title: "Sort by"),
        CustomDropdownMenu(
          values: const <String>["Recently logged-In First Member"],
          controller: TextEditingController(),
          hintText: "",
        ),
        CustomButton(
          onPressed: () async {},
          text: 'Search',
          shadowColor: CustomColors.shadowBlue,
          elevation: 5,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}
