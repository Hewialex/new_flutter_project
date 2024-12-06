import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/custom_functions.dart';
import 'package:qismati/common/models/person.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_list_card.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/common/widgets/custom_styled_container.dart';
import 'package:qismati/routes.dart';

class InteractionScreen extends StatelessWidget {
  const InteractionScreen({
    super.key,
    required this.onSelected,
    required this.people,
    required this.screenTitle,
    required this.onGuideButtonPressed,
    required this.menuOptions,
    this.onRefreshPressed,
  });

  final Function(int) onSelected;
  final VoidCallback? onRefreshPressed;
  final VoidCallback onGuideButtonPressed;
  final List<Person> people;
  final String screenTitle;
  final List<String> menuOptions;
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
                screenTitle,
                style: GoogleFonts.lexend(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 37.h),
              CustomButton(
                onPressed: onGuideButtonPressed,
                text: 'Your Guide To Success',
                shadowColor: CustomColors.shadowBlue,
                elevation: 5,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 33.h),
              CustomStyledContainer(
                leading: IconButton(
                  onPressed: onRefreshPressed,
                  icon: const Icon(
                    Icons.refresh,
                    color: CustomColors.primary,
                  ),
                ),
                containerContent: screenTitle,
              ),
              SizedBox(height: 33.h),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: people.asMap().entries.map((entry) {
                    final index = entry.key;
                    final e = entry.value;
                    return Column(
                      children: [
                        CustomListCard(
                          mainText: e.name,
                          subText: '${e.age} years',
                          leading: ClipOval(
                            child: Image.asset(
                              e.image,
                              width: 68.w,
                              height: 68.h,
                            ),
                          ),
                          bottomRightWidget: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: CustomColors.primary,
                                size: 11.sp,
                              ),
                              Text(
                                e.locationName,
                                style: GoogleFonts.lexend(
                                  fontSize: 11.sp,
                                  color: CustomColors.primary,
                                ),
                              ),
                            ],
                          ),
                          topRightWidget: GestureDetector(
                            onTapDown: (details) =>
                                CustomFunctions.showPopupMenu(
                              context,
                              index,
                              details.globalPosition,
                              menuOptions,
                              onSelected,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.more_vert,
                                color: CustomColors.primary,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                      ],
                    );
                  }).toList(),
                ),
              ),
              Text(
                people.length < 2
                    ? '${people.length} member'
                    : '${people.length} members',
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  decorationColor: CustomColors.primary,
                  color: CustomColors.primary,
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
