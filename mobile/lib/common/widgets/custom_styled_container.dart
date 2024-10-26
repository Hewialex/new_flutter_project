import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/features/contactus/widgets/stylish_title.dart';

class CustomStyledContainer extends StatelessWidget {
  const CustomStyledContainer({
    super.key,
    required this.containerContent,
    this.leading,
  });

  final String containerContent;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 318.w,
      height: 50.h,
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.primary),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leading ?? Container(),
              Text(
                containerContent,
                style: GoogleFonts.lexend(
                  textStyle: TextStyle(
                    fontSize: 13.sp,
                    color: CustomColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 20.w),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
              ),
              child: ClipPath(
                clipper: CornerClipper(),
                child: Container(
                  width: 20.w,
                  height: 20.h,
                  color: CustomColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
