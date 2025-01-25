import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';

class DatingCard extends StatelessWidget {
  final String name;
  final String gender;
  final bool isPremium;
  final bool isCentral;
  final String locationName;

  const DatingCard({
    super.key,
    required this.name,
    required this.gender,
    required this.isPremium,
    this.isCentral = false,
    required this.locationName,
  });

  Widget premiumContainer(BuildContext context) {
    return isPremium
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: CustomColors.premiumColor,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Text(
              'Premium',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          )
        : Container();
  }

  String getFormattedName(String name) {
    List<String> nameParts = name.split(' ');
    if (nameParts.length > 1) {
      return '${nameParts[0]} ${nameParts[1][0]}.';
    } else {
      return nameParts[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        color: isCentral
            ? CustomColors.background
            : CustomColors.background.withOpacity(0.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 20,
            offset: const Offset(0, 20), // Position of the shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getFormattedName(name),
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 10.w),
              if (isCentral) premiumContainer(context),
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
          const Spacer(),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: isCentral ? 200.h : 150.h,
                decoration: BoxDecoration(
                  color: CustomColors.languageContainerColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
              ),
              Image.asset(
                gender == "male"
                    ? "assets/images/male_avatar.png"
                    : "assets/images/female_avatar.png",
                width: isCentral ? 200.h : 150.h,
                height: isCentral ? 200.h : 150.h,
                fit: BoxFit.cover,
              ),
            ],
          )
        ],
      ),
    );
  }
}
