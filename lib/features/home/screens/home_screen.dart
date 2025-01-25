import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/models/profile.dart';
import 'package:qismati/common/widgets/nav_bar.dart';
import 'package:qismati/common/widgets/custom_drawer.dart';
import 'package:qismati/features/home/widgets/all_member_card.dart';
import 'package:qismati/features/home/widgets/dating_card.dart';
import 'package:qismati/features/home/widgets/home_heading.dart';
import 'package:qismati/features/home/widgets/search_dropdown.dart';
import 'package:qismati/features/nearyou/blocs/nearyou_bloc.dart';
import 'package:qismati/features/nearyou/profile_dummy.dart';
import 'package:qismati/features/notification/bloc/notification_bloc.dart';
import 'package:qismati/features/profile/screens/profile_screen.dart';
import 'package:qismati/routes.dart';
import 'package:qismati/generated/l10n.dart';
import 'package:qismati/features/home/cubit/visibility_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController(viewportFraction: 0.55);
  int currentPage = 0; // Variable to track the central card

  @override
  void initState() {
    super.initState();
    // Listen to the page changes
    pageController.addListener(() {
      if (pageController.page != null) {
        setState(() {
          currentPage = pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<VisibilityCubit, VisibilityState>(
                builder: (context, visibilityState) {
                  return Visibility(
                    visible: visibilityState.firstVisible,
                    child: Column(
                      children: [
                        SizedBox(height: 15.h),
                        HomeHeading(
                          text: S.of(context).interactWithHappiness,
                        ),
                        HomeHeading(
                          text: S.of(context).happiness,
                          color: CustomColors.primary,
                        ),
                        SizedBox(height: 30.h),
                        const SearchDropdown(),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 25.w),
                    child: Text(
                      S.of(context).nearYou,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<VisibilityCubit>().toggleVisibility();
                    },
                    child: Text(
                      S.of(context).viewAll,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF8B8B8B),
                        fontSize: 13.sp,
                      ),
                    ),
                  )
                ],
              ),
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

                    return SizedBox(
                      height: 300.h,
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: people.length,
                        itemBuilder: (context, index) {
                          bool isCentral = index == currentPage;
                          final person = people[index];
                          return AnimatedBuilder(
                            animation: pageController,
                            builder: (context, child) {
                              double value = 1.0;
                              if (pageController.position.haveDimensions) {
                                value = pageController.page! - index;
                                value =
                                    (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                              }
                              double height = isCentral ? 287.h : 209.h;
                              double width = isCentral ? 248.w : 186.w;

                              return Center(
                                child: SizedBox(
                                  height: height,
                                  width: width,
                                  child: child,
                                ),
                              );
                            },
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProfileScreen(),
                                  ),
                                );
                              },
                              child: DatingCard(
                                name: person.fullName,
                                gender: person.gender,
                                isPremium: true,
                                locationName: person.country,
                                isCentral:
                                    isCentral, // Pass isCentral flag here
                              ),
                            ),
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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
