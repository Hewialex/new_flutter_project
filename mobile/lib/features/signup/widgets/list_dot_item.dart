import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListDotItem extends StatelessWidget {
  final String text;
  final Color dotColor;
  final double dotSize;
  final double spacing;

  const ListDotItem({
    super.key,
    required this.text,
    this.dotColor = Colors.black,
    this.dotSize = 6.0,
    this.spacing = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: dotSize.w,
          height: dotSize.h,
          decoration: BoxDecoration(
            color: dotColor,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: spacing),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
