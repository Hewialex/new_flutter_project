import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';

class CustomListCard extends StatelessWidget {
  final String mainText;
  final String subText;
  final Widget? leading;
  final Widget? topRightWidget;
  final Widget? bottomRightWidget;
  final VoidCallback? onPressed;

  const CustomListCard({
    super.key,
    required this.mainText,
    required this.subText,
    this.leading,
    this.topRightWidget,
    this.bottomRightWidget,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: 318.w,
        height: 90.h,
        child: Container(
          decoration: BoxDecoration(
            color: CustomColors.textFieldBackground,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  if (leading != null)
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: leading,
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mainText,
                            style: GoogleFonts.lexend(
                              textStyle: TextStyle(
                                color: CustomColors.chatName,
                                fontWeight: FontWeight.w400,
                                fontSize: 18.sp,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Text(
                            subText,
                            style: GoogleFonts.lexend(
                              fontWeight: FontWeight.w300,
                              fontSize: 9.sp,
                              color: CustomColors.textGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Fixing Positioned Widgets
              if (topRightWidget != null)
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: topRightWidget!,
                ),
              if (bottomRightWidget != null)
                Positioned(
                  bottom: 10.h,
                  right: 10.w,
                  child: bottomRightWidget!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
