import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_dropdown_menu.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/common/widgets/custom_list_card.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/common/widgets/filter_select.dart';
import 'package:qismati/routes.dart';

class NewMembersScreen extends StatelessWidget {
  const NewMembersScreen({super.key});

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
              SizedBox(height: 20.h),
              Text(
                'New Members',
                style: GoogleFonts.kodchasan(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25.sp,
                    color: CustomColors.textGray,
                  ),
                ),
              ),
              SizedBox(height: 23.h),
              CustomDropdownMenu(
                values: const [],
                controller: TextEditingController(),
                hintText: 'Country',
              ),
              SizedBox(height: 32.h),
              FilterSelect(
                currentIndex: 1,
                onSelected: (index) {},
                choiceContent: const ["Public Photos", "Exclusive Photos"],
              ),
              SizedBox(height: 32.h),
              Expanded(
                child: ListView(
                  children: List.generate(10, (int index) {
                    return Column(
                      children: [
                        CustomListCard(
                          leading: ClipOval(
                              child: Image.asset(
                                  'assets/images/female_avatar.png')),
                          name: 'Saba Ashfaq',
                          age: 20,
                          locationName: "Paskistan",
                          onPressed: () {},
                          excludeTextTime: true,
                          iconButton: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_vert,
                              color: CustomColors.primary,
                              size: 20.sp,
                            ),
                          ),

                        ),
                        // ChatCard(
                        // ),
                        SizedBox(height: 10.h),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
