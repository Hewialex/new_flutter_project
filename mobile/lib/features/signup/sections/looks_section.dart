import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/widgets/custom_dropdown_menu.dart';

class LooksSection extends StatelessWidget {
  const LooksSection({
    super.key,
    required this.nationality,
  });
  final List<String> nationality;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
        value: "",
        onChanged: (value) {},
        hintText: "Weight-kg",
      ),
      SizedBox(height: 20.h),
      CustomDropdownMenu(
        values: nationality,
        value: "",
        onChanged: (value) {},
        hintText: "Height-cm",
      ),
      SizedBox(height: 20.h),
      CustomDropdownMenu(
        values: nationality,
        value: "",
        onChanged: (value) {},
        hintText: "Skin Color",
      ),
      SizedBox(height: 20.h),
      CustomDropdownMenu(
        values: nationality,
        value: "",
        onChanged: (value) {},
        hintText: "Body Shape",
      ),
    ]);
  }
}
