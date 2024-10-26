import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/routes.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({
    super.key,
    this.altRoute = Routes.home,
    this.excludeLangDropDown = false,
    this.excludeBackButton = false,
    this.altIcon,
  });

  final String altRoute;
  final bool excludeLangDropDown;
  final bool excludeBackButton;
  final Widget? altIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        excludeBackButton
            ? Container()
            : IconButton(
                onPressed: () {
                  try {
                    context.pop();
                  } catch (e) {
                    context.go(altRoute);
                  }
                },
                icon: const Icon(
                  Icons.chevron_left,
                  size: 35.0,
                ),
              ),
        excludeLangDropDown
            ? altIcon ??
                Container()
            : Row(
                children: [
                  Text(
                    'Eng',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //TODO: Add drop down for language
                    },
                    icon: const Icon(Icons.keyboard_arrow_down),
                  )
                ],
              )
      ],
    );
  }
}
