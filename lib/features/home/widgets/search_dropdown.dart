import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/routes.dart';
import 'package:qismati/generated/l10n.dart';

class SearchDropdown extends StatefulWidget {
  const SearchDropdown({super.key});

  @override
  createState() => _SearchDropdownState();
}

class _SearchDropdownState extends State<SearchDropdown> {
  String? selectedValue;
  List<String> dropdownItems = [];

  @override
  void initState() {
    super.initState();
    dropdownItems = [
      S.of(context).members,
      S.of(context).newMembers,
      S.of(context).onlineMembers,
      S.of(context).premiumMembers,
      S.of(context).autoSearcher,
    ];
  }

  List<String> dropdownImages = [
    'assets/members_drop_down/members.svg',
    'assets/members_drop_down/new_members.svg',
    'assets/members_drop_down/online_members.png',
    'assets/members_drop_down/premium_members.svg',
    'assets/members_drop_down/auto_searcher.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270.w, // Adjusts the width of the dropdown button itself
      height: 50.h,
      padding: EdgeInsets.only(left: 14.w),
      decoration: BoxDecoration(
        color: CustomColors.searchBackground,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: CustomColors.primary,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(S.of(context).search),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              icon: const Icon(Icons.keyboard_arrow_down),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
              items:
                  dropdownItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedValue == value
                          ? CustomColors.searchBackground
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          dropdownImages[dropdownItems.indexOf(value)],
                          width: 22.h,
                          height: 22.h,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 5.w),
                        Text(value),
                        if (selectedValue == value) const Spacer(),
                        if (selectedValue == value)
                          const Icon(
                            Icons.check,
                          ),
                      ],
                    ),
                  ),
                  onTap: () {
                    switch (value) {
                      case 'Members':
                        context.push(Routes.membersPhoto);
                      case 'New members':
                        context.push(Routes.newMembers);
                      case 'Online members':
                        context.push(Routes.onlineMembers);
                      case 'Premium members':
                        context.push(Routes.premiumMembers);
                      case 'Auto Searcher':
                        context.push(Routes.autoSearcher);
                      default:
                        return;
                    }
                  },
                );
              }).toList(),
              dropdownColor: Colors.white,
              isExpanded: false, // Makes the dropdown button non-expanded
              itemHeight: 60, // Adjusts the height of each dropdown item
              alignment: Alignment.center, // Centers the text inside each item
            ),
          ),
        ],
      ),
    );
  }
}
