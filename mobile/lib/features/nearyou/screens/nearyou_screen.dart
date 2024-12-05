import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_drawer.dart';
import 'package:qismati/common/widgets/custom_list_card.dart';
import 'package:qismati/features/home/widgets/dating_card.dart';
import 'package:qismati/features/home/widgets/home_heading.dart';
import 'package:qismati/features/nearyou/blocs/nearyou_bloc.dart';
import 'package:qismati/features/profile/screens/profile_screen.dart';
import 'package:qismati/routes.dart';

class NearYouScreen extends StatefulWidget {
  const NearYouScreen({super.key});

  @override
  State<NearYouScreen> createState() => _NearYouScreenState();
}

class _NearYouScreenState extends State<NearYouScreen> {
  final ScrollController _scrollController = ScrollController();

  void _onScroll() {
    debugPrint(
        "Scrolling ${_scrollController.position.pixels}  --> ${_scrollController.position.maxScrollExtent}");
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      debugPrint("Load more code block entered");
      context.read<NearYouBloc>().add(NearYouLoadMore());
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

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
                  debugPrint('Notification');
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
      body: BlocBuilder<NearYouBloc, NearYouState>(
        builder: (context, state) {
          debugPrint("State : $state");

          if (state is NearYouInitial) {
            context.read<NearYouBloc>().add(NearYouLoad());

            return const Center(
              child: CupertinoActivityIndicator(
                color: CustomColors.primary,
              ),
            );
          } else if (state is NearYouLoading && state.people.isEmpty) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: CustomColors.primary,
              ),
            );
 
          } else if (state is NearYouLoaded ||
              (state is NearYouLoading && state.people.isNotEmpty)) {

            final people = state is NearYouLoaded
                ? state.people
                : (state as NearYouLoading).people;

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

            return SafeArea(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(height: 60.h),
                        const HomeHeading(text: 'Near You'),
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
                                              builder: (context) =>
                                                  const ProfileScreen(),
                                            ),
                                          );
                                        },
                                        child: DatingCard(
                                          name: e.fullName,
                                          gender: e.gender,
                                          isPremium: true,
                                          locationName: e.country,
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
                      ],
                    ),
                  ),

                  // List of people
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index == people.length) {
                          return state is NearYouLoading && people.isNotEmpty
                              ? const Center(child: CircularProgressIndicator())
                              : const SizedBox.shrink();
                        }
                        final person = people[index];
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: CustomListCard(
                                leading: ClipOval(
                                  child: Center(
                                    child: Image.asset(
                                      'assets/images/female_avatar.png',
                                      width: 60.w,
                                      height: 60.h,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                name: person.fullName,
                                age: 20,
                                recentTextTime: DateTime.now(),
                                locationName: "Pakistan",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfileScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 5.h),
                          ],
                        );
                      },
                      childCount: people.length + 1,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is NearYouError) {
            return NearYouPermissionDenied(
              error: state.message,
              onRetry: () {
                context.read<NearYouBloc>().add(NearYouLoad());
              },
            );
          } else {
            return const Center(
              child: Text("Unknown state"),
            );
          }
        },
      ),
    );
  }
}

class NearYouPermissionDenied extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const NearYouPermissionDenied({
    super.key,
    required this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text(error),
          TextButton(
            onPressed: onRetry,
            child: const Text("Retry"),
          ),
          TextButton(
            onPressed: () {
              context.go(Routes.home);
            },
            child: const Text("Go to Home"),
          ),
        ],
      ),
    );
  }
}
