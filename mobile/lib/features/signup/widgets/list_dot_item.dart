import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ListDotItem extends StatelessWidget {
  final String text;
  final Color dotColor;
  final Color textColor;
  final double dotSize;
  final double spacing;
  final FontWeight fontWeight;

  const ListDotItem({
    super.key,
    required this.text,
    this.dotColor = Colors.black,
    this.dotSize = 6.0,
    this.spacing = 10.0,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.w300,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: dotSize.w,
              height: dotSize.h,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: spacing),
          Flexible(
            child: Text(text,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                softWrap: true,
                style: GoogleFonts.lexend(
                  textStyle: TextStyle(
                    fontWeight: fontWeight,
                    fontSize: 12.sp,
                    color: textColor,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
