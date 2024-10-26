import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/nav_bar.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/features/onboarding/widgets/slide_point.dart';
import 'package:qismati/features/premium/screens/feature_container.dart';
import 'package:qismati/features/signup/widgets/list_dot_item.dart';
import 'package:qismati/routes.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavBar(currentIndex: 1),
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: ContentContainer(
          child: Column(
            children: [
              SizedBox(height: 28.h),
              Text(
                'Premium Package',
                style: GoogleFonts.kodchasan(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25.sp,
                    color: CustomColors.textGray,
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Text(
                'For assistance with your payment, please contact us exclusively through whatsapp at',
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.whatsapp,
                      color: CustomColors.primary,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '4762387587346',
                      style: GoogleFonts.lexend(
                        textStyle: TextStyle(
                          color: CustomColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: CustomColors.primary,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'The Features',
                style: GoogleFonts.lexend(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              const ListDotItem(
                dotSize: 3,
                spacing: 2,
                text:
                    'The Premium package provide extra services and features which can boost your profile, increase your profile visits, and help you reach your goal quicker.',
              ),
              SizedBox(
                height: 199.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 20.w),
                    const FeatureContainer(
                      svgUrl: 'assets/images/rocket.svg',
                      title: 'Boost your profile',
                      featureContent:
                          'We’ll highlight your account promintly, placing it at the top of the list ahead of other members.',
                    ),
                    SizedBox(width: 10.w),
                    const FeatureContainer(
                      svgUrl: 'assets/images/messages.svg',
                      title: 'Message receiving settings',
                      featureContent:
                          'You can choose to accept messages exclusively from certain countries and block messages from other',
                    ),
                    SizedBox(width: 10.w),
                    const FeatureContainer(
                      svgUrl: 'assets/images/rocket.svg',
                      title: 'Message receiving settings',
                      featureContent:
                          'You can choose to accept messages exclusively from certain countries and block messages from other',
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Row(
                    children: [
                      SlidePoint(
                        isHiglighted: index == 0,
                        highLightedRadius: 15,
                      ),
                      SizedBox(width: 5.w)
                    ],
                  );
                }),
              ),
              SizedBox(height: 35.h),
              SizedBox(
                width: 295.w,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    context.push(Routes.features);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                        side: const BorderSide(color: CustomColors.primary),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 24.w,
                        height: 24.h,
                        decoration: const BoxDecoration(
                          color: CustomColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/images/premium_star.svg',
                          width: 15.w,
                          height: 15.h,
                        ),
                      ),
                      SizedBox(height: 18.h),
                      Text(
                        'My current Features',
                        style: GoogleFonts.lexend(
                            textStyle: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: CustomColors.primary,
                        )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
