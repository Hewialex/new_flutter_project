import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: CustomColors.primary,
        fontSize: 25.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
