import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/filter_container.dart';

class FilterSelect extends StatelessWidget {
  const FilterSelect({
    super.key,
    required this.currentIndex,
    required this.onSelected,
    required this.choiceContent,
  });

  final int currentIndex;
  final Function(int) onSelected;
  final List<String> choiceContent;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(choiceContent.length, (index) {
            return FilterContainer(
              onPressed: () => onSelected(index),
              text: choiceContent[index],
              isSelected: index == currentIndex,
            );
          })),
    );
  }
}
