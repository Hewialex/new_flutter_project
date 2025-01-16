import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/core/utils/get_formated_name.dart';

class AllMemberCard extends StatelessWidget {
  final String gender;
  final String name;
  final int age;
  final String location;

  const AllMemberCard({
    super.key,
    required this.gender,
    required this.name,
    required this.age,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Row(
          children: [
            // Image in circular box
            ClipOval(
              child: Image.asset(
                gender == "male"
                    ? "assets/images/male_avatar.png"
                    : "assets/images/female_avatar.png",
                width: 60.w,
                height: 60.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10.w),
            // Name and age
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getFormattedName(name),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  '$age years',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: CustomColors.textGray,
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Location
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: CustomColors.primary,
                  size: 20.w,
                ),
                SizedBox(width: 2.w),
                Text(
                  location,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: CustomColors.textGray,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
