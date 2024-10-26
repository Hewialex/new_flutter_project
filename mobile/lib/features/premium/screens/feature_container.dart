import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';

class FeatureContainer extends StatelessWidget {
  const FeatureContainer({
    super.key,
    required this.svgUrl,
    required this.title,
    required this.featureContent,
  });

  final String svgUrl;
  final String title;
  final String featureContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.background,
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
      width: 185.w,
      height: 199.h,
      child: Column(
        children: [
          SizedBox(height: 14.h),
          Container(
            height: 60.w,
            width: 60.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: ClipOval(
              child: Center(
                child: SvgPicture.asset(
                  svgUrl,
                  width: 37.w,
                  height: 37.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            title,
            style: GoogleFonts.lexend(
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              featureContent,
              textAlign: TextAlign.center,
              style: GoogleFonts.lexend(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 9.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
