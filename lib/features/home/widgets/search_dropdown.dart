import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/routes.dart';

class SearchDropdown extends StatefulWidget {
  const SearchDropdown({super.key});

  @override
  createState() => _SearchDropdownState();
}

class _SearchDropdownState extends State<SearchDropdown> {
  String? selectedValue;
  List<String> dropdownItems = [
    'Members',
    'New members',
    'Online members',
    'Premium members',
    'Auto searcher'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 238.w, // Adjusts the width of the dropdown button itself
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
          const Text('Search'),
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
                  child: Text(value),
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
