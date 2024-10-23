import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/common/widgets/nav_bar.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/common/widgets/custom_list_card.dart';
import 'package:qismati/routes.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      bottomNavigationBar: const NavBar(currentIndex: 2),
      body: SafeArea(
        child: ContentContainer(
          child: Column(
            children: [
              CustomTopBar(
                excludeBackButton: true,
                excludeLangDropDown: true,
                altIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: CustomColors.primary,
                  ),
                ),
              ),
              SizedBox(height: 26.h),
              Text(
                'My inbox',
                style: GoogleFonts.kodchasan(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25.sp,
                    color: CustomColors.headingGray,
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              Text(
                'Conversation',
                style: GoogleFonts.lexend(
                  textStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 15.w),
              CustomListCard(
                leading: ClipOval(
                  child: Center(
                    child: Image.asset(
                      'assets/images/female_avatar.png',
                      width: 60.w,
                      height: 60.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                name: 'Saba Ashfaq',
                age: 20,
                recentTextTime: DateTime.now(),
                locationName: "Pakistan",
                onPressed: () {
                  context.push(Routes.chat);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
