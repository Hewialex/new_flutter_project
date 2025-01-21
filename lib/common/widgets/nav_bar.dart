import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_nav_bar_item.dart';
import 'package:qismati/routes.dart';
import 'package:qismati/generated/l10n.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  void tapIndex(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(Routes.home);
        break;
      case 1:
        context.go(Routes.premium);
        break;
      case 2:
        context.go(Routes.messages);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => tapIndex(context, index),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            label: '',
            icon: currentIndex == 0
                ? CustomNavBarItem(
                    icon: const Icon(Icons.home, color: CustomColors.primary),
                    navBarTitle: S.of(context).home,
                  )
                : const Icon(Icons.home, color: CustomColors.iconsGray)),
        BottomNavigationBarItem(
            label: '',
            icon: currentIndex == 1
                ? CustomNavBarItem(
                    icon: const Icon(
                      Icons.diamond,
                      color: CustomColors.primary,
                    ),
                    navBarTitle: S.of(context).premium,
                  )
                : const Icon(Icons.diamond, color: CustomColors.iconsGray)),
        BottomNavigationBarItem(
          label: '',
          icon: currentIndex == 2
              ? CustomNavBarItem(
                  // icon: Icons.mail,
                  icon: SvgPicture.asset(
                    color: CustomColors.primary,
                    'assets/images/message_svg.svg',
                    width: 22.h,
                    height: 22.h,
                    fit: BoxFit.contain,
                  ),
                  navBarTitle: S.of(context).chatTitle,
                )
              : SvgPicture.asset(
                  color: CustomColors.iconsGray,
                  'assets/images/message_svg.svg',
                  width: 22.h,
                  height: 22.h,
                  fit: BoxFit.contain,
                ),
        )
      ],
    );
  }
}
