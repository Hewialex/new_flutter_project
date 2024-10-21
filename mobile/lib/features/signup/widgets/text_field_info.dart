import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldInfo extends StatelessWidget {
  const TextFieldInfo({
    super.key,
    required this.info,
  });

  final String info;

  @override
  Widget build(BuildContext context) {
    return Text(
      info,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 12.sp,
      ),
    );
  }
}
