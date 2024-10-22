import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_drawer.dart';
import 'package:qismati/common/widgets/nav_bar.dart';
import 'package:qismati/features/chat/widgets/chat_card.dart';
import 'package:qismati/features/home/screens/home_screen.dart';
import 'package:qismati/features/home/widgets/dating_card.dart';
import 'package:qismati/features/home/widgets/home_heading.dart';
import 'package:qismati/features/profile/screens/profile_screen.dart';

class NearYouScreen extends StatelessWidget {
  NearYouScreen({super.key});

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
              const HomeHeading(text: 'Near You'),
              // SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
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
              ),

              SizedBox(width: 35.w),

              Container(
                decoration: const BoxDecoration(
                  color: CustomColors.secondaryBackground,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  children: people.map((e) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: ChatCard(
                            imageUrl: 'assets/images/female_avatar.png',
                            name: e.name,
                            age: 20,
                            recentTextTime: DateTime.now(),
                            locationName: "Pakistan",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProfileScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 5.h),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
