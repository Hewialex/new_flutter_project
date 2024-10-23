import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';


class StyledTitle extends StatelessWidget {
  const StyledTitle({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 300.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: CustomColors.secondaryBackground, // Button background color
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: CustomColors.primary, // Border color
            width: 2.0,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12, // Optional shadow
              blurRadius: 5.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Center text
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: CustomColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Top-right corner shape
            Positioned(
              top: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(13.r),
                ),
                child: ClipPath(
                  clipper: CornerClipper(),
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    color: CustomColors.primary, // Color of top-right corner
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    // Move to top-right
    path.lineTo(size.width, 0);
    // Move to bottom-right
    path.lineTo(size.width, size.height);
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
