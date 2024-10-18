import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_left),
        ),
        Row(
          children: [
            Text(
              'Eng',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10.sp,
              ),
            ),
            IconButton(
              onPressed: () {
                //TODO: Add drop down for language
              },
              icon: const Icon(Icons.keyboard_arrow_down),
            )
          ],
        )
      ],
    );
  }
}
