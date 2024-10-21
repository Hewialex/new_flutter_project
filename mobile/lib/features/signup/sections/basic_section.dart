import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/widgets/custom_dropdown_menu.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/features/signup/widgets/text_field_info.dart';

class BasicSection extends StatelessWidget {
  const BasicSection({
    super.key,
    required this.nationality,
  });

  final List<String> nationality;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(text: "Username"),
        SizedBox(height: 21.h),
        const TextFieldInfo(
          info:
              'The user name is the nick name that appears to all members it must be decent and respectfull, and it can’t exceed 15 characters.',
        ),
        SizedBox(height: 41.h),
        const CustomTextField(text: "Full name"),
        SizedBox(height: 20.h),
        const CustomTextField(text: "Phone Number"),
        SizedBox(height: 20.h),
        const CustomTextField(text: "Email"),
        SizedBox(height: 20.h),
        const CustomTextField(text: "Password", obsecureText: true),
        SizedBox(height: 20.h),
        const CustomTextField(text: "Confirm Password", obsecureText: true),
        const TextFieldInfo(
          info:
              'It must at least 6 characters long and must not contain special characters.',
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: nationality,
          value: '',
          onChanged: (value) {},
          hintText: "Nationality",
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: nationality,
          value: '',
          onChanged: (value) {},
          hintText: "Country",
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: nationality,
          value: '',
          onChanged: (value) {},
          hintText: "City",
        ),
      ],
    );
  }
}
