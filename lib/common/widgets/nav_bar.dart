import 'package:flutter/material.dart';
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
                    icon: Icons.home,
                    navBarTitle: S.of(context).home,
                  )
                : const Icon(Icons.home, color: CustomColors.iconsGray)),
        BottomNavigationBarItem(
            label: '',
            icon: currentIndex == 1
                ? CustomNavBarItem(
                    icon: Icons.diamond,
                    navBarTitle: S.of(context).premium,
                  )
                : const Icon(Icons.diamond, color: CustomColors.iconsGray)),
        BottomNavigationBarItem(
            label: '',
            icon: currentIndex == 2
                ? CustomNavBarItem(
                    icon: Icons.mail,
                    navBarTitle: S.of(context).chatTitle,
                  )
                : const Icon(Icons.mail, color: CustomColors.iconsGray))
      ],
    );
  }
}
