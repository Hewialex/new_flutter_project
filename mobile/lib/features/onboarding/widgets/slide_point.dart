import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';

class SlidePoint extends StatelessWidget {
  const SlidePoint({
    super.key,
    required this.isHiglighted,
    this.highLightedRadius = 5,
  });
  final bool isHiglighted;
  final double highLightedRadius;

  @override
  Widget build(BuildContext context) {
    return isHiglighted
        ? Container(
            width: highLightedRadius.w,
            height: 15.h,
            decoration: BoxDecoration(
              color: CustomColors.primary,
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
          )
        : Container(
            width: 5.w,
            height: 5.h,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: CustomColors.slideGray),
          );
  }
}
