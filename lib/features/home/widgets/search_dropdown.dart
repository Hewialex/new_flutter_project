import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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

  bool showSuggestions = false;

  void _toggleSuggestions() {
    if (showSuggestions) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    }
    setState(() {
      showSuggestions = !showSuggestions;
    });
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        width: 270.w,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, 60.h), // Adjusted the offset for more space
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(10.r), // Apply border radius here
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Material(
                elevation: 4.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: dropdownItems.length,
                  itemBuilder: (context, index) {
                    final value = dropdownItems[index];
                    final isSelected = selectedValue == value;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedValue = value;
                          showSuggestions = false;
                        });
                        _overlayEntry?.remove();
                        _overlayEntry = null;
                        switch (value) {
                          case 'Members':
                            context.push(Routes.membersPhoto);
                            break;
                          case 'New members':
                            context.push(Routes.newMembers);
                            break;
                          case 'Online members':
                            context.push(Routes.onlineMembers);
                            break;
                          case 'Premium members':
                            context.push(Routes.premiumMembers);
                            break;
                          case 'Auto Searcher':
                            context.push(Routes.autoSearcher);
                            break;
                          default:
                            return;
                        }
                      },
                      child: Container(
                        color: isSelected
                            ? CustomColors.dropDownSelectedItemColor
                            : Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 8.h), // Reduced padding
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 3.h),
                              decoration: !isSelected
                                  ? null
                                  : BoxDecoration(
                                      color: CustomColors.primary,
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                              child: SvgPicture.asset(
                                dropdownImages[index],
                                width: 22.h,
                                height: 22.h,
                                fit: BoxFit.contain,
                                color: isSelected ? Colors.white : null,
                              ),
                            ),
                            SizedBox(width: 8.w), // Slightly adjusted width
                            Text(
                              value,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                            if (isSelected) const Spacer(),
                            if (isSelected)
                              const Icon(
                                Icons.check,
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleSuggestions,
        child: Container(
          width: 270.w,
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 14.w),
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
              if (selectedValue != null)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        dropdownImages[dropdownItems.indexOf(selectedValue!)],
                        width: 22.h,
                        height: 22.h,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 5.w),
                      Text(selectedValue!),
                    ],
                  ),
                ),
              if (selectedValue == null) const Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
      ),
    );
  }
}
