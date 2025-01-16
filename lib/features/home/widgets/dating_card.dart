import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';

class DatingCard extends StatelessWidget {
  final String name;
  final String gender;
  final bool isPremium;
  final String locationName;

  const DatingCard({
    super.key,
    required this.name,
    required this.gender,
    required this.isPremium,
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
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        gradient: const RadialGradient(
          colors: [Color(0x2BFFFFFF), Color(0x2B000000)],
          radius: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              Text(
                getFormattedName(name),
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 10.w),
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
          const Spacer(),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: 0, // Adjust this value as needed
                child: Container(
                  width: 150, // Width of the circular box
                  height: 150, // Height of the circular box
                  decoration: BoxDecoration(
                    color: CustomColors.languageContainerColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ),
              Image.asset(
                gender == "male"
                    ? "assets/images/male_avatar.png"
                    : "assets/images/female_avatar.png",
                width: double.infinity,
                height: 150.h,
                fit: BoxFit.cover,
              ),
            ],
          )
        ],
      ),
    );
  }
}
