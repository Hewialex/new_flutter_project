import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentContainer extends StatelessWidget {
  const ContentContainer({
    super.key,
    required this.child,
    this.color = Colors.white,
  });

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 341.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(30.r),
          ),
        ),
        child: child,
      ),
    );
  }
}
