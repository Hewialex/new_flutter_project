import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/routes.dart';

class FavoriteListScreen extends StatelessWidget {
  const FavoriteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: ContentContainer(
          child: Column(
            children: [
              const CustomTopBar(
                altRoute: Routes.home,
                excludeLangDropDown: true,
              ),
              SizedBox(height: 10.h),
              Text(
                'Favorite List',
                style: GoogleFonts.lexend(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 37.h),
              CustomButton(
                onPressed: () {},
                text: 'Your Guide To Success',
                shadowColor: CustomColors.shadowBlue,
                elevation: 5,
                fontWeight: FontWeight.w600,
              ),
              Container(
                width: 318.w,
                height: 50.h,
                decoration: BoxDecoration(
                  border: Border.all(color: CustomColors.primary),
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.refresh,
                        color: CustomColors.primary,
                      ),
                    ),
                    Text(
                      'Favorite list',
                      style: GoogleFonts.lexend(
                          textStyle: TextStyle(
                        fontSize: 13.sp,
                        color: CustomColors.primary,
                        fontWeight: FontWeight.w500,
                      )),
                    ),
                    Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
