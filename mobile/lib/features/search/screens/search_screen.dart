import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/features/search/sections/search_by_username_section.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  // the currently open accordion index
  int openIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomTopBar(
              excludeLangDropDown: true,
            ),
            Text(
              'Search',
              style: GoogleFonts.lexend(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25.sp,
                  color: CustomColors.headingGray,
                ),
              ),
            ),
            Accordion(
              headerBorderColor: CustomColors.primary,
              headerBorderWidth: 2,
              // headerBorderRadius: 15,
              headerBackgroundColor: Colors.transparent,
              contentBackgroundColor: Colors.white,
              contentBorderColor: Colors.transparent,
              contentBorderWidth: 3,
              // contentHorizontalPadding: 20,
              scaleWhenAnimating: true,
              openAndCloseAnimation: true,
              sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
              sectionClosingHapticFeedback: SectionHapticFeedback.light,
              accordionId: 'search',
              children: [
                AccordionSection(
                  isOpen: true,
                  contentVerticalPadding: 20,
                  rightIcon: const Icon(Icons.arrow_drop_down),
                  header: Container(
                      height: 40.h,
                      padding: EdgeInsets.all(10.w),
                      child: const Text('Search by username')),
                  content: const SearchByUsernameSection(),
                ),
                AccordionSection(
                  isOpen: true,
                  contentVerticalPadding: 20,
                  rightIcon: const Icon(Icons.arrow_drop_down),
                  header: Container(
                      height: 40.h,
                      padding: EdgeInsets.all(10.w),
                      child: const Text('Quick Search')),
                  content: const SearchByUsernameSection(),
                ),

                AccordionSection(
                  isOpen: true,
                  contentVerticalPadding: 20,
                  rightIcon: const Icon(Icons.arrow_drop_down),
                  header: Container(
                      height: 40.h,
                      padding: EdgeInsets.all(10.w),
                      child: const Text('Advanced Search')),
                  content: const SearchByUsernameSection(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
