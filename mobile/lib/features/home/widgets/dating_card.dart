import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';

class DatingCard extends StatelessWidget {
  const DatingCard({
    super.key,
    required this.name,
    required this.image,
    required this.isPremium,
    required this.locationName,
  });

  final String name;
  final String image;
  final bool isPremium;
  final String locationName;

  Widget premiumContainer() {
    return isPremium
        ? Container(
            width: 89.w,
            margin: EdgeInsets.only(bottom: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.r),
              ),
              color: CustomColors.primary,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.workspace_premium,
                  color: Colors.white,
                ),
                Text(
                  'Premium',
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
      width: 253.w,
      height: 287.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        gradient: const RadialGradient(
          colors: [Color(0x2BFFFFFF), Color(0x2B000000)],
          radius: 0.5,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 32.sp,
                  color: Colors.white,
                ),
              ),
              premiumContainer(),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: CustomColors.primary,
              ),
              Text(
                locationName,
                style: TextStyle(
                  color: CustomColors.primary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Image.asset(
            image,
            width: 215.w,
            height: 213.h,
          )
        ],
      ),
    );
  }
}
