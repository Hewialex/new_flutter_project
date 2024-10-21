import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_nav_bar_item.dart';
import 'package:qismati/routes.dart';

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
                ? const CustomNavBarItem(
                    icon: Icons.home,
                    navBarTitle: "Home",
                  )
                : const Icon(Icons.home, color: CustomColors.iconsGray)),
        BottomNavigationBarItem(
            label: '',
            icon: currentIndex == 1
                ? const CustomNavBarItem(
                    icon: Icons.diamond,
                    navBarTitle: "Premium",
                  )
                : const Icon(Icons.diamond, color: CustomColors.iconsGray)),
        BottomNavigationBarItem(
            label: '',
            icon: currentIndex == 2
                ? const CustomNavBarItem(
                    icon: Icons.mail,
                    navBarTitle: "Message",
                  )
                : const Icon(Icons.mail, color: CustomColors.iconsGray))
      ],
    );
  }
}
