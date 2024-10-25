import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart'; // Adjust this import based on your project structure

class CustomOptionTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Widget? endIcon;

  const CustomOptionTile({
    super.key,
    required this.title,
    this.endIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.lexend(
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: CustomColors.headingGray,
              ),
            ),
          ),
          endIcon ??
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: CustomColors.headingGray,
              ),
        ],
      ),
    );
  }
}
