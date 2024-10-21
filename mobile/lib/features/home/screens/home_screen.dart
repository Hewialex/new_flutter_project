import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/nav_bar.dart';
import 'package:qismati/features/home/widgets/dating_card.dart';
import 'package:qismati/features/home/widgets/home_heading.dart';
import 'package:qismati/features/home/widgets/search_dropdown.dart';
import 'package:qismati/features/profile/screens/profile_screen.dart';
import 'package:qismati/routes.dart';

class People {
  final String name;
  final String image;
  final String locationName;
  final bool isPremium;

  People({
    required this.name,
    required this.image,
    required this.locationName,
    required this.isPremium,
  });
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<People> people = [
    People(
      name: "Fatima",
      image: "assets/images/female_avatar.png",
      locationName: "Saudi",
      isPremium: false,
    ),
    People(
      name: "Alisha",
      image: "assets/images/female_avatar.png",
      locationName: "Pakistan",
      isPremium: true,
    ),
    People(
      name: "Luluwa",
      image: "assets/images/female_avatar.png",
      locationName: "Dubai",
      isPremium: true,
    ),
    People(
      name: "Ekram",
      image: "assets/images/female_avatar.png",
      locationName: "Dubai",
      isPremium: false,
    ),
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
                        onTap: () {},
                      ),
                    ),
                    _buildDrawerItem(
                      _DrawerItem(
                        title: 'My Profile',
                        icon: const Icon(Icons.person_2_outlined),
                        onTap: () {},
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
                        onTap: () {},
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
                          onTap: () {}),
                    ),
                    _buildDrawerItem(
                      _DrawerItem(
                        title: 'Member Photo',
                        icon: const Icon(Icons.person_outline_rounded),
                        onTap: () {},
                      ),
                    ),
                    _buildDrawerItem(
                      _DrawerItem(
                        title: 'Contact Us',
                        icon: const Icon(Icons.phone_in_talk_sharp),
                        onTap: () {},
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
                        onTap: () {},
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
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 25.h),
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                color: CustomColors.primary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
            ),
            onPressed: () {},
          )
        ],
      ),
      bottomNavigationBar: const NavBar(currentIndex: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 60.h),
              const HomeHeading(text: 'Interact With Your'),
              const HomeHeading(
                text: 'Happiness!',
                color: CustomColors.primary,
              ),
              SizedBox(height: 60.h),
              const SearchDropdown(),
              SizedBox(height: 70.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 25.w),
                    child: Text(
                      'Near You',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'View all',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF8B8B8B),
                          fontSize: 13.sp,
                        ),
                      ))
                ],
              ),
              SizedBox(height: 15.h),
              SizedBox(
                height: 286.h,
                child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: people.map((e) {
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProfileScreen(),
                                ),
                              );
                            },
                            child: DatingCard(
                              name: e.name,
                              image: e.image,
                              isPremium: e.isPremium,
                              locationName: e.locationName,
                            ),
                          ),
                          SizedBox(width: 15.w),
                        ],
                      );
                    }).toList()),
              ),
            ],
          ),
        ),
      ),
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
