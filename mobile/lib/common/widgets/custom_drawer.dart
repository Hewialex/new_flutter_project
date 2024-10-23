import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/routes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 4,
      child: IconButton(
        icon: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(0),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // profile
                  _drawerProfileSection(),

                  _buildDrawerItem(
                    _DrawerItem(
                      title: 'Home',
                      icon: const Icon(Icons.home_outlined),
                      onTap: () {},
                    ),
                  ),
                  _buildDrawerItem(
                    _DrawerItem(
                      title: 'Notification',
                      icon: const Icon(Icons.notifications_outlined),
                      onTap: () {
                        context.push(Routes.notification);
                      },
                    ),
                  ),
                  _buildDrawerItem(
                    _DrawerItem(
                      title: 'My Profile',
                      icon: const Icon(Icons.person_2_outlined),
                      onTap: () {
                        context.push(Routes.myProfile);
                      },
                    ),
                  ),
                  _buildExpandibleDrawerItem(_ExpandibleDrawerItem(
                    title: 'Settings',
                    icon: const Icon(Icons.settings_outlined),
                    onTap: () {},
                    children: [
                      _buildDrawerItem(
                        _DrawerItem(
                          title: 'Account Information',
                          icon: const Icon(Icons.info_outlined),
                          onTap: () {},
                        ),
                      ),
                      _buildDrawerItem(
                        _DrawerItem(
                          title: 'Profile Settings',
                          icon: const Icon(Icons.settings_outlined),
                          onTap: () {},
                        ),
                      ),
                    ],
                  )),
                  _buildDrawerItem(
                    _DrawerItem(
                      title: 'Search',
                      icon: const Icon(Icons.search),
                      onTap: () {
                        context.push(Routes.searchScreen);
                      },
                    ),
                  ),
                  _buildDrawerItem(
                    _DrawerItem(
                      title: 'Ignore List',
                      icon: const Icon(Icons.thumb_down_outlined),
                      onTap: () {},
                    ),
                  ),
                  _buildDrawerItem(
                    _DrawerItem(
                        title: 'Who Favorited Me?',
                        icon: const Icon(Icons.favorite_outline_rounded),
                        onTap: () {
                          context.push(Routes.favorite);
                        }),
                  ),
                  _buildDrawerItem(
                    _DrawerItem(
                      title: 'Member Photo',
                      icon: const Icon(Icons.person_outline_rounded),
                      onTap: () {
                        context.push(Routes.membersPhoto);
                      },
                    ),
                  ),
                  _buildDrawerItem(
                    _DrawerItem(
                      title: 'Contact Us',
                      icon: const Icon(Icons.phone_in_talk_sharp),
                      onTap: () {
                        context.push(Routes.contactUs);
                      },
                    ),
                  ),
                  _buildDrawerItem(
                    _DrawerItem(
                      title: 'Share App',
                      icon: Transform.rotate(
                        angle: -pi /
                            2, // Rotate 90 degrees (pi/2 radians countreclockwise)
                        child: const Icon(Icons.exit_to_app),
                      ),
                      onTap: () {},
                    ),
                  ),
                  _buildDrawerItem(
                    _DrawerItem(
                      title: 'About Us',
                      icon: const Icon(Icons.info_outline),
                      onTap: () {
                        context.push(Routes.aboutUs);
                      },
                    ),
                  ),
                  _buildDrawerItem(
                    _DrawerItem(
                      title: 'Sign Out',
                      icon: const Icon(Icons.exit_to_app),
                      onTap: () {
                        context.go(Routes.login);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildDrawerItem(_DrawerItem option) {
    return ListTile(
      title: Text(option.title),
      leading: option.icon,
      onTap: option.onTap as void Function()?,
      trailing: option.trailingIcon,
    );
  }

  Widget _buildExpandibleDrawerItem(_ExpandibleDrawerItem option) {
    return ExpansionTile(
      title: Text(option.title),
      leading: option.icon,
      childrenPadding: const EdgeInsets.only(left: 20),
      children: option.children!,
    );
  }

  Widget _drawerProfileSection() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: CustomColors.primary,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // profile image
          Container(
            margin: EdgeInsets.only(right: 10.w),
            width: 50.w,
            height: 50.h,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage('assets/images/female_avatar.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // profile name and user name
          Column(
            children: [
              Text(
                'Fatima',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '@fatima',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: CustomColors.textGray,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _ExpandibleDrawerItem {
  final String title;
  final Widget icon;
  final Function onTap;
  final List<Widget>? children;
  final Widget? trailingIcon;

  _ExpandibleDrawerItem({
    required this.title,
    required this.icon,
    required this.onTap,
    // ignore: unused_element
    this.trailingIcon,
    this.children,
  });
}

class _DrawerItem {
  final String title;
  final Widget icon;
  final Function onTap;
  final Widget? trailingIcon;

  _DrawerItem({
    required this.title,
    required this.icon,
    required this.onTap,
    // ignore: unused_element
    this.trailingIcon,
  });
}

