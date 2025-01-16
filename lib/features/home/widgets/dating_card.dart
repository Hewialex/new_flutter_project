import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/generated/l10n.dart';

class DatingCard extends StatelessWidget {
  const DatingCard({
    super.key,
    required this.name,
    required this.isPremium,
    required this.locationName,
    required this.gender,
  });

  final String name;
  final bool isPremium;
  final String gender;
  final String locationName;

  Widget premiumContainer(BuildContext context) {
    return isPremium
        ? Container(
            width: 89.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.r),
              ),
              color: CustomColors.premiumColor,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.workspace_premium,
                  color: Colors.white,
                ),
                Text(
                  S.of(context).premium,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 230.w,
      height: 250.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        gradient: const RadialGradient(
          colors: [Color(0x2BFFFFFF), Color(0x2B000000)],
          radius: 0.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 115.w,
                child: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              premiumContainer(context),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: CustomColors.primary,
                size: 12.sp,
              ),
              Text(
                locationName,
                style: TextStyle(
                  color: CustomColors.primary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Center(
            child: Image.asset(
              gender == "male"
                  ? "assets/images/male_avatar.png"
                  : "assets/images/female_avatar.png",
              width: 150.w,
              height: 150.h,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
