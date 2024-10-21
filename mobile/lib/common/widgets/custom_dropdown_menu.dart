import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';

class CustomDropdownMenu extends StatelessWidget {
  const CustomDropdownMenu({
    super.key,
    required this.values,
    required this.value,
    required this.onChanged,
    required this.hintText,
  });

  final List<String> values;
  final ValueChanged<dynamic> onChanged;
  final String value;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 318.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: CustomColors.textFieldBackground,
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 19.w),
          child: DropdownButton<String>(
            hint: Text(hintText),
            underline: const SizedBox.shrink(),
            isExpanded: true,
            dropdownColor: CustomColors.textFieldBackground,
            value: value.isEmpty ? null : value,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: values.map((e) {
              return DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ));
  }
}
