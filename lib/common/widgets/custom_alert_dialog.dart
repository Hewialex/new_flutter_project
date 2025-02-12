import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/generated/l10n.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String? content;
  final List<Widget>? actions;

  const CustomAlertDialog({
    super.key,
    required this.title,
    this.content,
    this.actions,
  });

  // Static method to show the dialog
  static Future<dynamic> show(BuildContext context,
      {required String title, String? content, List<Widget>? actions}) {
    final localizations = S.of(context);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: title,
          content: content,
          actions: actions,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CustomColors.background,
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
          ),
        ),
      ),
      content: Text(
        content ?? '',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15.sp,
        ),
      ),
      actions: actions,
    );
  }
}
