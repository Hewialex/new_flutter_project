import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';

class HomeHeading extends StatelessWidget {
  const HomeHeading({
    super.key,
    required this.text,
    this.color = CustomColors.headingGray,
  });

  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 25.h),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 25.sp,
          color: color,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
