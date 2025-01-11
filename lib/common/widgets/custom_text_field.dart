import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? text;
  final String? Function(String? text)? validator;
  final Widget? suffix;
  final Widget? prefix;
  final Function()? onTab;
  final TextInputType? keyboardType;
  final bool readOnly;
  final bool enableFocusColor;
  final String? prefixText;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final FocusNode? focusNode;
  final Key? globalKey;
  final Function(String)? onChanged;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? border;
  final bool? autoFocus;
  final TextStyle? hintTextStyle;
  final int? maxLine;
  final int width;
  const CustomTextField(
      {super.key,
      required this.controller,
      this.globalKey,
      this.validator,
      this.text,
      this.suffix,
      this.prefix,
      this.onTab,
      this.keyboardType,
      this.readOnly = false,
      this.prefixText,
      this.enableFocusColor = true,
      this.obscureText = false,
      this.inputFormatters,
      this.focusNode,
      this.onChanged,
      this.borderRadius,
      this.fontSize,
      this.contentPadding =
          const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      this.border,
      this.autoFocus,
      this.maxLine,
      this.hintTextStyle,
      this.width = 318,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: width.w,
      child: TextFormField(
        key: globalKey,
        autofocus: autoFocus ?? false,
        focusNode: focusNode,
        onTap: onTab,
        onTapOutside: (p) {
          if (Platform.isIOS) {
            FocusScope.of(context).unfocus();
          }
        },
        maxLines: maxLine ?? 1,
        onChanged: onChanged,
        obscureText: obscureText,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        readOnly: readOnly,
        cursorColor: CustomColors.primary,
        style: TextStyle(
          fontSize: fontSize ?? 15,
          fontWeight: FontWeight.w500,
        ),
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          filled: true,
          fillColor: CustomColors.textFieldBackground,
          errorText: errorText,
          contentPadding: contentPadding,
          hintText: text,
          hintStyle: hintTextStyle ??
              TextStyle(
                fontSize: fontSize ?? 15,
                color: const Color(0xFF8E8E8E),
                fontWeight: FontWeight.w500,
              ),
          prefixText: prefixText != null ? '$prefixText ' : null,
          prefixIcon: prefix,
          suffixIcon: suffix,
          prefixStyle: TextStyle(
            fontSize: fontSize ?? 15,
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: const BorderSide(
                color: Colors.transparent, // No border when not focused
              )),
          border: border ??
              OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: Colors.transparent, // No border when not focused
                ),
              ),
          focusedBorder: border ??
              OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(14),
                borderSide: enableFocusColor
                    ? const BorderSide(
                        color: CustomColors.primary,
                        width: 2,
                      )
                    : const BorderSide(),
              ),
        ),
      ),
    ));
  }
}
