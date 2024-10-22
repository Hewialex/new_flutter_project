import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:qismati/common/colors.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.age,
    required this.locationName,
    required this.onPressed,
    this.excludeTextTime = false,
    this.recentTextTime,
    this.iconButton,
  });

  final String imageUrl;
  final String name;
  final int age;
  final DateTime? recentTextTime;
  final bool excludeTextTime;
  final String locationName;
  final VoidCallback onPressed;
  final IconButton? iconButton;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 318.w,
        height: 90.h,
        decoration: BoxDecoration(
          color: CustomColors.textFieldBackground,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Container(
                width: 70.w,
                height: 70.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: ClipOval(
                  child: Center(
                    child: Image.asset(
                      imageUrl,
                      width: 60.w,
                      height: 60.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: GoogleFonts.lexend(
                    textStyle: TextStyle(
                      color: CustomColors.chatName,
                      fontWeight: FontWeight.w400,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                Text(
                  '$age years',
                  style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w300,
                      fontSize: 9.sp,
                      color: CustomColors.textGray),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: excludeTextTime
                      ? EdgeInsets.only(top: 2.h, left: 20.w)
                      : EdgeInsets.only(top: 10.h),
                  child: excludeTextTime
                      ? iconButton
                      : Text(
                          DateFormat('h:m a').format(recentTextTime!),
                          style: GoogleFonts.lexend(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 9.sp,
                              color: CustomColors.textGray,
                            ),
                          ),
                        ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 13.h, right: 10.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: CustomColors.primary,
                        size: 11.sp,
                      ),
                      Text(
                        locationName,
                        style: GoogleFonts.lexend(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 10.sp,
                            color: CustomColors.primary,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
