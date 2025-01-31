import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/features/onboarding/widgets/slide_point.dart';
import 'package:qismati/routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<String> titles = [
    'Find your partner with us',
    'Marriage is a great relationship',
    'Find your perfect life partner'
  ];

  final List<String> images = [
    'assets/images/onboarding_one.png',
    'assets/images/onboarding_two.png',
    'assets/images/onboarding_three.png'
  ];

  int currentIndex = 0;
  final PageController _pageController = PageController(); // Page Controller

  void changePage() {
    if (currentIndex < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go(Routes.register);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 47.h),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: titles.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        images[index],
                        width: 212.w,
                        height: 366.w,
                      ),
                      Container(
                        width: 335.w,
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.r),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              titles[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32.sp,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                              width: 295.w,
                              child: Text(
                                'Amet minim mollit non deserunt sit aliqua dolor do amet sint.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            SizedBox(height: 30.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(3, (index) {
                                return Row(
                                  children: [
                                    SlidePoint(isHiglighted: index == currentIndex),
                                    SizedBox(width: 5.w)
                                  ],
                                );
                              }),
                            ),
                            SizedBox(height: 30.h),
                            CustomButton(
                              onPressed: changePage,
                              text: currentIndex < 2 ? 'Next' : 'Get Started',
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
