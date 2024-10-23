import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/common/widgets/nav_bar.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/common/widgets/custom_list_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      bottomNavigationBar: const NavBar(currentIndex: 0),
      body: SafeArea(
        child: ContentContainer(
          child: Column(
            children: [
              CustomTopBar(
                excludeBackButton: false,
                excludeLangDropDown: true,
                altIcon: IconButton(
                  onPressed: () {},
                  icon: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomColors.primary,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete_outline,
                            color: CustomColors.secondaryBackground,
                          ),
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomColors.primary,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          color: CustomColors.primary,
                          icon: const Icon(
                            Icons.settings_outlined,
                            color: CustomColors.secondaryBackground,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 26.h),
              Text(
                'Notification',
                style: GoogleFonts.lexend(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25.sp,
                    color: CustomColors.headingGray,
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              CustomListCard(
                leading: const Icon(Icons.mail, color: CustomColors.primary),
                iconButton: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert_rounded),
                ),
                name: 'Saba Ashfaq',
                age: 20,
                excludeTextTime: true,
                recentTextTime: DateTime.now(),
                locationName: "5 Minutes Ago",
                onPressed: () {
                  //
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
