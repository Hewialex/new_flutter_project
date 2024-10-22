import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField({
    super.key,
    required this.controller,
    this.placeholder,
    this.validator,
  });

  final TextEditingController controller;
  final String? placeholder;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 318.w,
      height: 120.h,
      decoration: BoxDecoration(
        color: CustomColors.textFieldBackground,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLines: null,
        expands: true,
        decoration: InputDecoration(
          labelText: placeholder ?? "",
          contentPadding: const EdgeInsets.all(10),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
