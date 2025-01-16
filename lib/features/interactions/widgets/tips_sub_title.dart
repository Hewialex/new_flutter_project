import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/features/signup/widgets/list_dot_item.dart';
import 'package:qismati/generated/l10n.dart';

class TipsSubTitle extends StatelessWidget {
  const TipsSubTitle({
    super.key,
    required this.subTitle,
  });

  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w),
      child: ListDotItem(
        text: subTitle,
        dotColor: CustomColors.primary,
        textColor: CustomColors.primary,
        dotSize: 3,
        spacing: 1,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
