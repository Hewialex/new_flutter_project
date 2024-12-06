import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/custom_functions.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_dropdown_menu.dart';
import 'package:qismati/common/widgets/custom_list_card.dart';
import 'package:qismati/common/widgets/custom_list_card.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/common/widgets/filter_select.dart';
import 'package:qismati/routes.dart';

class MembersPhotoScreen extends StatelessWidget {
  const MembersPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
          child: ContentContainer(
              child: Column(
        children: [
          const CustomTopBar(
            excludeLangDropDown: true,
            altRoute: Routes.home,
          ),
          SizedBox(height: 10.h),
          Text(
            'Members Photo',
            style: GoogleFonts.lexend(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 28.h),
          FilterSelect(
            currentIndex: 0,
            onSelected: (p0) {},
            choiceContent: const [
              "Public Photos",
              "Exclusive Photos",
            ],
          ),
          SizedBox(height: 14.h),
          CustomDropdownMenu(
            values: const [],
            controller: TextEditingController(),
            hintText: 'Country',
          ),
          SizedBox(height: 28.h),
          Expanded(
            child: ListView(
                padding: const EdgeInsets.all(5),
                children: List.generate(3, (int index) {
                  return Column(children: [
                    CustomListCard(
                      mainText: 'Saba Ashfaq',
                      subText: '20 years',
                      leading: Image.asset(
                        'assets/images/female_avatar.png',
                        width: 68.w,
                        height: 68.h,
                      ),
                      bottomRightWidget: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: CustomColors.primary,
                            size: 11.sp,
                          ),
                          Text(
                            'Pakistan',
                            style: GoogleFonts.lexend(
                              textStyle: TextStyle(
                                color: CustomColors.textGray,
                                fontWeight: FontWeight.w300,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      topRightWidget: GestureDetector(
                        onTapDown: (details) => CustomFunctions.showPopupMenu(
                          context,
                          index,
                          details.globalPosition,
                          [],
                          (selectedOption) {},
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
                  ]);
                })),
          ),
          CustomButton(
            onPressed: () {},
            text: 'Show More',
            shadowColor: CustomColors.shadowBlue,
            elevation: 5,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 20.h),
        ],
      ))),
    );
  }
}
