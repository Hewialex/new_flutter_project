import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/nav_bar.dart';
import 'package:qismati/common/widgets/custom_drawer.dart';
import 'package:qismati/features/home/widgets/dating_card.dart';
import 'package:qismati/features/home/widgets/home_heading.dart';
import 'package:qismati/features/home/widgets/search_dropdown.dart';
import 'package:qismati/features/notification/bloc/notification_bloc.dart';
import 'package:qismati/features/profile/screens/profile_screen.dart';
import 'package:qismati/routes.dart';

class People {
  final String name;
  final String image;
  final String locationName;
  final bool isPremium;
  final bool isMale;

  People({
    required this.name,
    required this.image,
    required this.locationName,
    required this.isPremium,
    this.isMale = true,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                color: CustomColors.primary,
                shape: BoxShape.circle,
              ),
              child: Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      context.push(Routes.notification);
                      debugPrint('Notification');
                    },
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    right: 1,
                    bottom: 1,
                    child: BlocBuilder<NotificationBloc, NotificationState>(
                      builder: (context, state) {
                        if (state is NotificationSuccess) {
                          if (state.notifications.isNotEmpty) {
                            return Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            );
                          }
                          return const SizedBox(); // No indicator when no unread notifications
                        }
                        else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                height: 350.h, // Adjust as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: people.length,
                  itemBuilder: (context, index) {
                    final person = people[index];
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
                          child: Container(
                            width: 200.w, // Set a fixed width for the card
                            child: DatingCard(
                              name: person.name,
                              image: person.image,
                              isPremium: person.isPremium,
                              locationName: person.locationName,
                            ),
                          ),
                        ),
                        SizedBox(width: 35.w),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
