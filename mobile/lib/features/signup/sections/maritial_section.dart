import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/widgets/custom_dropdown_menu.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';

class MaritialSection extends StatelessWidget {
  const MaritialSection({
    super.key,
    required this.nationality,
  });
  final List<String> nationality;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Maritial Status',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 25.h),
        CustomDropdownMenu(
          values: nationality,
          value: '',
          onChanged: (value) {},
          hintText: "Status",
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: nationality,
          value: '',
          onChanged: (value) {},
          hintText: "Status",
        ),
        SizedBox(height: 20.h),
        const CustomTextField(text: 'Age'),
        SizedBox(height: 20.h),
        const CustomTextField(text: 'Children'),
      ],
    );
  }
}
