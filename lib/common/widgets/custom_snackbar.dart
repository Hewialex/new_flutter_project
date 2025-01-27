import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart'; // Ensure your custom color file is imported

void showCustomSnackbar() {}

class CustomSnackBar {
  final BuildContext context;
  final String message;
  final SnackBarType? type;
  final Duration duration;

  CustomSnackBar({
    required this.context,
    required this.message,
    this.type = SnackBarType.info,
    this.duration = const Duration(seconds: 2),
  });

  // Map colors to each SnackBarType
  final Map<SnackBarType, Color> _backgroundColors = {
    SnackBarType.success: CustomColors.success,
    SnackBarType.error: CustomColors.error,
    SnackBarType.warning: CustomColors.warning,
    SnackBarType.info: CustomColors.primary,
  };

  void showSnack() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: CustomColors.background,
            fontSize: 14.sp,
          ),
        ),
        backgroundColor: _backgroundColors[type],
        duration: duration,
      ),
    );
  }
}

enum SnackBarType {
  success,
  error,
  warning,
  info,
}
