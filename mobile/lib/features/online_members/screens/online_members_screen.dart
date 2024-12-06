import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/custom_functions.dart';
import 'package:qismati/common/widgets/custom_dropdown_menu.dart';
import 'package:qismati/common/widgets/custom_list_card.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/common/widgets/filter_select.dart';
import 'package:qismati/features/online_members/bloc/online_member_bloc.dart';
import 'package:qismati/routes.dart';

class OnlineMembersScreen extends StatelessWidget {
  OnlineMembersScreen({super.key});

  final menuOptions = [
    'Like',
    'Ignore',
    'Other options',
  ];

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<OnlineMemberBloc>();
    final state = bloc.state;

    print(state);

    switch (state) {
      case OnlineMemberInitial():
        bloc.add(FetchData());
        return const Scaffold(
          body: CupertinoActivityIndicator(
            color: CustomColors.primary,
          ),
        );
      case OnlineMemberLoading():
        return const Scaffold(
          body: Center(
            child: CupertinoActivityIndicator(
              color: CustomColors.primary,
            ),
          ),
        );
      case OnlineMemberLoaded():
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
                    'Online Members',
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
                    choiceContent: const ["All", "Female", "Male"],
                  ),
                  SizedBox(height: 32.h),
                  Expanded(
                    child: ListView(
                      children: state.users.asMap().entries.map((entries) {
                        final index = entries.key;
                        final e = entries.value;

                        return Column(
                          children: [
                            CustomListCard(
                              mainText: e.fullName,
                              subText: '${e.age} Years',
                              leading: ClipOval(
                                child: Image.asset(e.gender == "male"
                                    ? 'assets/images/male_avatar.png'
                                    : 'assets/images/female_avatar.png'),
                              ),
                              topRightWidget: GestureDetector(
                                onTapDown: (details) =>
                                    CustomFunctions.showPopupMenu(
                                        context,
                                        index,
                                        details.globalPosition,
                                        menuOptions, (selectedOption) {
                                  bloc.add(
                                    SelectOption(
                                        option: menuOptions[selectedOption],
                                        userId: e.id,
                                        removedIndex: index),
                                  );
                                  debugPrint(
                                      "Selected option is ${menuOptions[selectedOption]}");
                                }),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.more_vert,
                                    color: CustomColors.primary,
                                    size: 20.sp,
                                  ),
                                ),
                              ),
                              bottomRightWidget: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 13.h, right: 10.w),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: CustomColors.primary,
                                        size: 11.sp,
                                      ),
                                      Text(
                                        e.country,
                                        style: GoogleFonts.lexend(
                                          textStyle: TextStyle(
                                            color: CustomColors.textGray,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 9.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            SizedBox(height: 10.h),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      default:
        return Scaffold(
          body: Center(
            child: Text('Unimplemented state $state'),
          ),
        );
    }
  }
}
