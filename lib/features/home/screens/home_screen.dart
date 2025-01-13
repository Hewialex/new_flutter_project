import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sliding_toast/flutter_sliding_toast.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/models/profile.dart';
import 'package:qismati/common/widgets/nav_bar.dart';
import 'package:qismati/common/widgets/custom_drawer.dart';
import 'package:qismati/features/home/widgets/dating_card.dart';
import 'package:qismati/features/home/widgets/home_heading.dart';
import 'package:qismati/features/home/widgets/search_dropdown.dart';
import 'package:qismati/features/nearyou/blocs/nearyou_bloc.dart';
import 'package:qismati/features/notification/bloc/notification_bloc.dart';
import 'package:qismati/features/profile/screens/profile_screen.dart';
import 'package:qismati/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationBloc = context.read<NotificationBloc>();
    notificationBloc.add(NotificationLoad());

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return InkWell(
              onTap: Scaffold.maybeOf(context)!.openDrawer,
              child: Transform.scale(
                scale: 0.5,
                child: SvgPicture.asset(
                  'assets/images/drawer_icon.svg',
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
        ),
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
                        } else {
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
      body: Stack(
        children: [
          SafeArea(
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
                            // context.push(Routes.nearYouScreen);
                            InteractiveToast.slide(context,
                                leading: Container(
                                  width: 40.w,
                                  height: 40.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: ClipOval(
                                    child: Center(
                                      child: Image.asset(
                                        'assets/images/female_avatar.png',
                                        width: 30.w,
                                        height: 30.h,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                title: SizedBox(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Aligns text to the start
                                    mainAxisSize: MainAxisSize
                                        .min, // Shrinks the column to fit content
                                    children: [
                                      Text(
                                        'Samira Abdella',
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w800,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                      SizedBox(
                                          height: 4
                                              .h), // Adds spacing between the two text widgets
                                      Text(
                                        'Hi this is Samira, I am not sure if you know me',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow
                                            .ellipsis, // Truncates long text with ellipsis
                                        maxLines:
                                            1, // Ensures only one line of text is shown
                                      ),
                                    ],
                                  ),
                                ),
                                toastSetting: const SlidingToastSetting(
                                    toastAlignment: Alignment.topCenter));
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
                  BlocBuilder<NearYouBloc, NearYouState>(
                      builder: (context, state) {
                    debugPrint("Near You State : $state");
                    if (state is NearYouLoaded) {
                      final List<ProfileModel> people = state.people;

                      if (people.isEmpty) {
                        return const Center(
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.person_search,
                                  size: 100,
                                  color: CustomColors.primary,
                                ),
                                Text(
                                  "No one near you",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      // Near You
                      return SizedBox(
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
                                        builder: (context) =>
                                            const ProfileScreen(),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    width: 200.w,
                                    child: DatingCard(
                                      name: person.fullName,
                                      gender: person.gender,
                                      isPremium: true,
                                      locationName: person.country,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 35.w),
                              ],
                            );
                          },
                        ),
                      );
                    } else if (state is NearYouInitial) {
                      context.read<NearYouBloc>().add(NearYouLoad(page: 1));
                      return const Center(
                          child: CupertinoActivityIndicator(
                        color: CustomColors.primary,
                      ));
                    } else if (state is NearYouError) {
                      return Text(state.message);
                    } else if (state is NearYouLoading) {
                      return const Center(
                          child: CupertinoActivityIndicator(
                        color: CustomColors.primary,
                      ));
                    } else {
                      return const SizedBox(
                        child: Text("Unknown State"),
                      );
                    }
                  }),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
