import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';

class FilterContainer extends StatelessWidget {
  const FilterContainer({
    super.key,
    required this.onPressed,
    required this.text,
    required this.isSelected,
  });

  final VoidCallback onPressed;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        height: 26.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? CustomColors.primary : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.lexend(
            textStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
          ),
        ),
      ),
    );
  }
}
