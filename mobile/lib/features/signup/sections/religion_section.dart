import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/widgets/custom_dropdown_menu.dart';

class ReligionSection extends StatelessWidget {
  const ReligionSection({
    super.key,
    required this.nationality,
    required this.religionCommitmentController,
    required this.prayerController,
    required this.smokingController,
    required this.beardController,
  });

  final List<String> nationality;
  final TextEditingController religionCommitmentController;
  final TextEditingController prayerController;
  final TextEditingController smokingController;
  final TextEditingController beardController;

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
        controller: religionCommitmentController,
        hintText: "Religion Commitment",
      ),

      SizedBox(height: 20.h),

      CustomDropdownMenu(
        values: nationality,
        controller: prayerController,
        hintText: "Prayer",
      ),

      SizedBox(height: 20.h),

      CustomDropdownMenu(
        values: nationality,
        controller: smokingController,
        hintText: "Smoking",
      ),

      SizedBox(height: 20.h),

      CustomDropdownMenu(
        values: nationality,
        controller: beardController,
        hintText: "Beard",
      ),
    ]);
  }
}
