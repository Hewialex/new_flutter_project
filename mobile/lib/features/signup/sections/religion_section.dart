import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/widgets/custom_dropdown_menu.dart';

class ReligionSection extends StatelessWidget {
  const ReligionSection({
    super.key,
    required this.nationality,
  });

  final List<String> nationality;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'Religion',
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
        hintText: "Religion Commitment",
      ),
      SizedBox(height: 20.h),
      CustomDropdownMenu(
        values: nationality,
        value: "",
        onChanged: (value) {},
        hintText: "Prayer",
      ),
      SizedBox(height: 20.h),
      CustomDropdownMenu(
        values: nationality,
        value: "",
        onChanged: (value) {},
        hintText: "Smoking",
      ),
      SizedBox(height: 20.h),
      CustomDropdownMenu(
        values: nationality,
        value: "",
        onChanged: (value) {},
        hintText: "Beard",
      ),
    ]);
  }
}
