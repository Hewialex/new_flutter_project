import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';

class CustomDropdownMenu extends StatefulWidget {
  const CustomDropdownMenu({
    super.key,
    required this.values,
    required this.controller,
    required this.hintText,
    this.onChanged,
  });

  final List<String> values;
  final String hintText;
  final TextEditingController controller;
  final Function(String?)? onChanged;

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
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
            hint: Text(widget.hintText),
            underline: const SizedBox.shrink(),
            isExpanded: true,
            dropdownColor: CustomColors.textFieldBackground,
            value:
                widget.controller.text.isEmpty ? null : widget.controller.text,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: widget.values.map((e) {
              return DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: widget.onChanged ??
                (value) {
                  setState(() {
                    widget.controller.text = value!;
                  });
                },
          ),
        ));
  }
}
