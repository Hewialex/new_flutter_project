import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.shadowColor,
    this.width = 295,
    this.height = 56,
    this.fontSize = 18,
    this.isInverted = false,
    this.elevation = 0,
    this.fontWeight = FontWeight.w300,
  });

  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;
  final double fontSize;
  final bool isInverted;
  final double elevation;
  final Color? shadowColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: shadowColor != null
            ? [
                BoxShadow(
                  color: shadowColor ?? Colors.transparent,
                  offset: const Offset(0, 5),
                  blurRadius: 10,
                ),
              ]
            : null,
      ),
      child: SizedBox(
        width: width.w,
        height: height.h,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isInverted ? Colors.white : CustomColors.primary,
            elevation: elevation,
            shadowColor: shadowColor,
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
              fontWeight: fontWeight,
              color: isInverted ? CustomColors.primary : Colors.white,
              fontSize: fontSize.sp,
            ),
          ),
        ),
      ),
    );
  }
}

