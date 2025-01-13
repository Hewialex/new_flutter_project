import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/widgets/custom_dropdown_menu.dart';
import 'package:qismati/features/signup/utils/signup_dropdown_values.dart';

class ReligionSection extends StatelessWidget {
  const ReligionSection({
    super.key,
    required this.nationality,
    required this.religionCommitmentController,
    required this.prayerController,
    required this.smokingController,
    required this.beardController,
    required this.vielController,
    required this.gender,
  });

  final List<String> nationality;
  final TextEditingController religionCommitmentController;
  final TextEditingController prayerController;
  final TextEditingController smokingController;
  final TextEditingController beardController;
  final TextEditingController vielController;
  final String gender;

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
        values: religiousCommitmentDropdownValues,
        controller: religionCommitmentController,
        hintText: "Religion Commitment",
      ),
      SizedBox(height: 20.h),
      CustomDropdownMenu(
        values: prayerDropdownValues,
        controller: prayerController,
        hintText: "Prayer",
      ),
      SizedBox(height: 20.h),
      CustomDropdownMenu(
        values: smokingDropdownValues,
        controller: smokingController,
        hintText: "Smoking",
      ),
      SizedBox(height: 20.h),
      gender == "Male"
          ? CustomDropdownMenu(
              values: beardDropdownValues,
              controller: beardController,
              hintText: "Beard",
            )
          : Container(),
      gender == "Female"
          ? CustomDropdownMenu(
              values: veilDropdownValues,
              controller: vielController,
              hintText: "Veil",
            )
          : Container(),
    ]);
  }
}
