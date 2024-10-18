import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = 295,
    this.height = 56,
    this.fontSize = 18,
    this.isInverted = false,
  });

  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;
  final double fontSize;
  final bool isInverted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isInverted ? Colors.white : CustomColors.primary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
            side: isInverted
                ? const BorderSide(color: CustomColors.primary)
                : BorderSide.none,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: isInverted ? CustomColors.primary : Colors.white,
            fontSize: fontSize.sp,
          ),
        ),
      ),
    );
  }
}
