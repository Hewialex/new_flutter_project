// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:qismati/common/colors.dart';

class PinInputField extends StatelessWidget {
  const PinInputField({
    super.key,
    required this.onPressed,
    this.width = 295,
    this.height = 56,
    this.fontSize = 18,
    this.shadowColor,
  });

  final void Function(String) onPressed;
  final double width;
  final double height;
  final double fontSize;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: shadowColor != null
            ? [
                BoxShadow(
                  color: shadowColor ?? Colors.transparent,
                  offset: const Offset(0, 5),
                  blurRadius: 10,
                ),
              ]
            : null,
      ),
      child: SizedBox(
        width: width.w,
        height: height.h,
        child: PinCodeTextField(
          keyboardType: TextInputType.number,
          length: 4,
          obscureText: false,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.circle,
            selectedColor: CustomColors.pinFieldColor,
            activeColor: CustomColors.pinFieldColor,
            inactiveColor: CustomColors.primary,
            fieldHeight: 50,
            fieldWidth: 50,
          ),
          animationDuration: const Duration(milliseconds: 30),
          controller: TextEditingController(),
          enabled: true,
          onCompleted: (otp) {
            onPressed(otp);
          },
          beforeTextPaste: (text) {
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
          appContext: context,
        ),
      ),
    );
  }
}
