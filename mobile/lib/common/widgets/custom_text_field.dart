import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    required this.controller,
    this.trailingIcon,
    this.validator,
    this.obsecureText = false,
    this.readOnly = false,
    this.height = 50,
    this.width = 318,
  });

  final String text;
  final bool obsecureText;
  final bool readOnly;
  final double width;
  final double height;
  final Icon? trailingIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          color: CustomColors.textFieldBackground,
        ),
        child: TextFormField(
          validator: validator,
          obscureText: obsecureText,
          readOnly: readOnly,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: CustomColors
                .textFieldBackground, // Background color for the TextField
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: const BorderSide(
                color: Colors.transparent, // No border when not focused
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(
                color: CustomColors.primary, // Outline color when focused
                width: 2.w,
              ),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            hintText: text,
            suffixIcon: trailingIcon,
          ),
        ),
      ),
    );
  }
}
