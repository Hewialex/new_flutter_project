import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';

class AboutusScreen extends StatelessWidget {
  const AboutusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: ContentContainer(
          child: Column(
            children: [
              const CustomTopBar(
                excludeBackButton: false,
                excludeLangDropDown: true,
              ),
              Text(
                'About us',
                style: GoogleFonts.kodchasan(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25.sp,
                    color: CustomColors.headingGray,
                  ),
                ),
              ),
              SizedBox(height: 26.h),
              Text(
                'lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, vestibulum nunc sit amet, ultrices nisl. Nulla facilisi. Nulla nec purus feugiat, vestibulum nunc sit amet, ultrices nisl. Nulla facilisi.',
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  textStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                'lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, vestibulum nunc sit amet, ultrices nisl. Nulla facilisi. Nulla nec purus feugiat, vestibulum nunc sit amet, ultrices nisl. Nulla facilisi.',
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  textStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                'lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, vestibulum nunc sit amet, ultrices nisl. Nulla facilisi. Nulla nec purus feugiat, vestibulum nunc sit amet, ultrices nisl. Nulla facilisi.',
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  textStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
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
