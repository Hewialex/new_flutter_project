import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_styled_container.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/features/interactions/widgets/tips_content.dart';
import 'package:qismati/features/interactions/widgets/tips_sub_title.dart';
import 'package:qismati/features/interactions/widgets/tips_title.dart';
import 'package:qismati/features/signup/widgets/list_dot_item.dart';
import 'package:qismati/routes.dart';

class TipsExtra {
  final String screenTitle;
  final String routes;

  TipsExtra({
    required this.screenTitle,
    required this.routes,
  });
}

class TipsScreen extends StatelessWidget {
  const TipsScreen({
    super.key,
    required this.tipsExtra,
  });
  final TipsExtra tipsExtra;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: ContentContainer(
          child: Column(
            children: [
              CustomTopBar(
                altRoute: tipsExtra.routes,
                excludeLangDropDown: true,
              ),
              SizedBox(height: 10.h),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        tipsExtra.screenTitle,
                        style: GoogleFonts.lexend(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      const CustomStyledContainer(
                        containerContent: 'Your Guide To Success',
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        'Welcome to Qismati tips page',
                        style: GoogleFonts.lexend(
                          textStyle: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      const ListDotItem(
                        text:
                            'If you’re a new subscriber or still searching for your life partner, here are some simple profile modification and communication tip to help you succeed . Follow these suggestion to increase your chance of success and inspire other on their journey to find love',
                        dotSize: 4,
                        spacing: 3,
                      ),
                      SizedBox(height: 24.h),
                      const TipsTitle(title: 'Profile Information: '),
                      SizedBox(height: 15.h),
                      const TipsSubTitle(subTitle: 'Username'),
                      const TipsContent(
                        content:
                            'Your username is your nickname in the App, and it should reflect your personality . Avoid using meaningless symbols or numbers . your username can influence other members when they check your profile or send you a message . So, choose a unique memorable username that show cases your personality and stand out.',
                      ),
                      SizedBox(height: 15.h),
                      const TipsSubTitle(
                        subTitle: 'Describe yourself and your ideal partner',
                      ),
                      const TipsContent(
                        content:
                            'Tell us about yourself and your ideal partner . Please be truthfulll and objective when discribing your self and the person you’re seeking . Leaving this field blank may limit your chance and finding a suitable match, so be sure to provide detail and accurate information',
                      ),
                      SizedBox(height: 20.h),
                      CustomButton(
                        onPressed: () {
                          context.push(Routes.myProfile);
                        },
                        text: 'Edit your profile',
                        shadowColor: CustomColors.shadowBlue,
                        elevation: 5,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 20.h),
                      const TipsTitle(title: 'Messaging'),
                      SizedBox(height: 20.h),
                      const TipsContent(
                        content:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mattis varius leo in faucibus. Phasellus faucibus, tellus dapibus',
                      ),
                      SizedBox(height: 20.h),
                      const ListDotItem(
                        text:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mattis varius leo in faucibus. Phasellus faucibus, tellus dapibus lobortis bibendum, nisi lectus convallis sapien, quis elementum lorem justo sit amet orci. In quis',
                        dotSize: 4,
                        spacing: 3,
                      ),
                      SizedBox(height: 20.h),
                      const ListDotItem(
                        text:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mattis varius leo in faucibus. Phasellus faucibus, tellus dapibus lobortis bibendum, nisi lectus convallis sapien, quis',
                        dotSize: 4,
                        spacing: 3,
                      ),
                      SizedBox(height: 25.h),
                      const TipsTitle(title: 'Photo'),
                      const TipsContent(
                        content:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mattis varius leo in faucibus. Phasellus faucibus, tellus dapibus',
                      ),
                      SizedBox(height: 30.h),
                      CustomButton(
                        onPressed: () {},
                        text: 'Add photo',
                        shadowColor: CustomColors.shadowBlue,
                        elevation: 5,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 50.h),
                      const TipsTitle(title: 'Notification'),
                      const TipsContent(
                        content:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mattis varius leo in faucibus. Phasellus faucibus, tellus dapibus',
                      ),
                      SizedBox(height: 15.h),
                      CustomButton(
                        onPressed: () {},
                        text: 'My Settings',
                        shadowColor: CustomColors.shadowBlue,
                        elevation: 5,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 25.h),
                      const TipsTitle(title: 'General Tips: '),
                      const TipsContent(
                        content:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mattis varius leo in faucibus. Phasellus faucibus, tellus dapibus lobortis bibendum, nisi lectus convallis sapien, quis elementum lorem justo sit amet orci. In quis dictum augue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris egestas pharetra aliquet. Nam eleifend diam vel justo molestie varius. Praesent egestas, massa vel faucibus vehicula,',
                      ),
                      SizedBox(height: 22.h),
                      const ListDotItem(
                        text:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mattis varius leo in faucibus. Phasellus faucibus, tellus dapibus lobortis bibendum, nisi lectus convallis sapien, quis',
                        dotSize: 4,
                        spacing: 3,
                      ),
                      SizedBox(height: 15.h),
                      const ListDotItem(
                        text:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mattis varius leo in faucibus. Phasellus faucibus, tellus dapibus lobortis bibendum, nisi lectus convallis sapien, quis',
                        dotSize: 4,
                        spacing: 3,
                      ),
                      const Divider(),
                      Text(
                        'Qismati team wishes you success',
                        style: GoogleFonts.lexend(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: CustomColors.primary,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
