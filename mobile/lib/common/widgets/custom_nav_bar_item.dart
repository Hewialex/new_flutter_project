import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';

class CustomNavBarItem extends StatelessWidget {
  const CustomNavBarItem({
    super.key,
    required this.icon,
    required this.navBarTitle,
  });

  final IconData icon;
  final String navBarTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 124.w,
      height: 40.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: CustomColors.background,
          borderRadius: BorderRadius.all(
            Radius.circular(100.r),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: CustomColors.primary),
          Text(
            navBarTitle,
            style: TextStyle(
              fontSize: 12.sp,
              color: CustomColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
