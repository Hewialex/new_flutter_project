import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TipsContent extends StatelessWidget {
  const TipsContent({
    super.key,
    required this.content,
  });

  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Text(
        content,
        textAlign: TextAlign.center,
        overflow: TextOverflow.visible,
        softWrap: true,
        style: GoogleFonts.lexend(
          textStyle: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }
}
