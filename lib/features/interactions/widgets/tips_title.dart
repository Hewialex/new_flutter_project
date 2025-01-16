import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/generated/l10n.dart';

class TipsTitle extends StatelessWidget {
  const TipsTitle({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 30.w),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: GoogleFonts.lexend(
          textStyle: TextStyle(
            color: CustomColors.textGreen,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
