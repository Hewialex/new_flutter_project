import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_dropdown_menu.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/features/chat/widgets/chat_card.dart';
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
              // Leave this for now changing between genders,
              Container(
                alignment: Alignment.center,
                width: 302.w,
                height: 32.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.w,
                    color: CustomColors.borderOutline,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.sp),
                  ),
                ),
                child: Row(
                  children: [
                    FilterContainer(
                      text: 'All',
                      onPressed: () {},
                      isSelected: false,
                    ),
                    FilterContainer(
                      text: 'Females',
                      onPressed: () {},
                      isSelected: true,
                    ),
                    FilterContainer(
                      text: 'Male',
                      onPressed: () {},
                      isSelected: false,
                    )
                  ],
                ),
              ),

              SizedBox(height: 32.h),
              Expanded(
                child: ListView(
                  children: List.generate(10, (int index) {
                    return Column(
                      children: [
                        ChatCard(
                          imageUrl: 'assets/images/female_avatar.png',
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
                        SizedBox(height: 10.h),
                      ],
                    );
                  }),
                  // children: [
                  //   ChatCard(
                  //     imageUrl: 'assets/images/female_avatar.png',
                  //     name: 'Saba Ashfaq',
                  //     age: 20,
                  //     locationName: "Paskistan",
                  //     onPressed: () {},
                  //     excludeTextTime: true,
                  //     iconButton: IconButton(
                  //       onPressed: () {},
                  //       icon: Icon(
                  //         Icons.more_vert,
                  //         color: CustomColors.primary,
                  //         size: 20.sp,
                  //       ),
                  //     ),
                  //   ),
                  //   SizedBox(height: 10.h),
                  //   ChatCard(
                  //     imageUrl: 'assets/images/female_avatar.png',
                  //     name: 'Saba Ashfaq',
                  //     age: 20,
                  //     locationName: "Paskistan",
                  //     onPressed: () {},
                  //     excludeTextTime: true,
                  //     iconButton: IconButton(
                  //       onPressed: () {},
                  //       icon: Icon(
                  //         Icons.more_vert,
                  //         color: CustomColors.primary,
                  //         size: 20.sp,
                  //       ),
                  //     ),
                  //   ),
                  // ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterContainer extends StatelessWidget {
  const FilterContainer({
    super.key,
    required this.onPressed,
    required this.text,
    required this.isSelected,
  });

  final VoidCallback onPressed;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 100.w,
        height: 26.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? CustomColors.primary : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.lexend(
            textStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
          ),
        ),
      ),
    );
  }
}
