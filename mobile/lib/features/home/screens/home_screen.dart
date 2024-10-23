import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/nav_bar.dart';
import 'package:qismati/common/widgets/custom_drawer.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
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
                onPressed: () {
                  context.push(Routes.notification);
                },
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
                      onPressed: () {
                        context.push(Routes.nearYouScreen);
                      },
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
                  children: people.map(
                    (e) {
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
                          SizedBox(width: 35.w),
                        ],
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
