import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/models/profile.dart';
import 'package:qismati/common/widgets/custom_alert_dialog.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/core/database/database_helper.dart';
import 'package:qismati/core/websocket/websocket.dart';
import 'package:qismati/features/my_profile/bloc/myprofile_bloc.dart';
import 'package:qismati/routes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(

      elevation: 4,
      child: Container(
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
                _drawerProfileSection(context),

                _buildDrawerItem(
                  _DrawerItem(
                    title: 'Home',
                    icon: const Icon(Icons.home_outlined),
                    onTap: () {
                      // retract drawer
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                _buildDrawerItem(
                  _DrawerItem(
                    title: 'Notification',
                    icon: const Icon(Icons.notifications_outlined),
                    onTap: () {
                      context.push(Routes.notification);
                      debugPrint('Notification');
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
                        onTap: () {
                          context.push(Routes.accountInformationScreen);
                        },
                      ),
                    ),
                    _buildDrawerItem(
                      _DrawerItem(
                        title: 'Profile Settings',
                        icon: const Icon(Icons.settings_outlined),
                        onTap: () {
                          context.push(Routes.accountSettings);
                        },
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
                    onTap: () {
                      context.push(Routes.ignore);
                    },
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
                _buildDrawerLogOutItem(
                  _DrawerItem(
                    title: 'Sign Out',
                    icon: const Icon(
                      Icons.exit_to_app,
                      color: CustomColors.signOutRed,
                    ),
                    onTap: () async {
                      // The result varable is used to track user choice from alert.
                      final bool result = await CustomAlertDialog.show(
                        context,
                        title: 'Confirmation',
                        content: 'Are you sure do you want to Sign out?',
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                width: 100.w,
                                isInverted: true,
                                onPressed: () => context.pop(false),
                                text: 'No',
                                fontWeight: FontWeight.w600,
                                shadowColor: CustomColors.shadowBlue,
                              ),
                              CustomButton(
                                width: 100.w,
                                onPressed: () => context.pop(true),
                                text: 'Yes',
                                fontWeight: FontWeight.w600,
                                shadowColor: CustomColors.shadowBlue,
                              ),
                            ],
                          ),
                        ],
                      );

                      if (result && context.mounted) {
                        final DatabaseHelper databaseHelper =
                            RepositoryProvider.of<DatabaseHelper>(context);
                        final WebsocketService websocketService =
                            RepositoryProvider.of<WebsocketService>(context);

                        // Perform operations sequentially
                        await websocketService.disconnectFromServer();
                        await databaseHelper.deleteToken();

                        if (!context.mounted) return;

                        // Navigate after ensuring all tasks are completed
                        context.go(Routes.login);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
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

  Widget _buildDrawerLogOutItem(_DrawerItem option) {
    return ListTile(
      title: Text(
        option.title,
        style: const TextStyle(color: CustomColors.signOutRed),
      ),
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

  Widget _drawerProfileSection(BuildContext context) {
    final bloc = context.read<MyprofileBloc>();
    bloc.add(LoadMyProfile());

    return BlocBuilder<MyprofileBloc, MyprofileState>(
      builder: (context, state) {
        switch (state) {
          case MyprofileInitial():
            bloc.add(LoadMyProfile());
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          case MyprofileLoading():
            return const Center(
              child: CupertinoActivityIndicator(),
            );

          case MyprofileSuccess():
            final profile = state.profile;
            return _profileWidget(profile);

          case MyprofileUpdateSuccess():
            final profile = state.profile;
            return _profileWidget(profile);

          case MyprofileUpdateError():
            final profile = state.profile;
            return _profileWidget(profile);

          case MyprofileError():
            return Center(
              child: Column(
                children: [
                  const Text('Unable to load user profile'),
                  TextButton(
                    onPressed: () {
                      bloc.add(LoadMyProfile());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );

          default:
            // Any unimplemented state for Myprofile goes here
            return Center(
              child: Text('Unimplemented state $state'),
            );
        }
      },
    );
  }

  Widget _profileWidget(ProfileModel profile) {
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile image with constraints
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  profile.gender == "male"
                      ? 'assets/images/male_avatar.png'
                      : 'assets/images/female_avatar.png',
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Profile name and username with flexible text
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.fullName,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
                SizedBox(height: 4.h),
                Text(
                  profile.userName,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: CustomColors.textGray,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
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
