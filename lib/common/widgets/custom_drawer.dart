import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/models/profile.dart';
import 'package:qismati/common/widgets/custom_alert_dialog.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/core/database/database_helper.dart';
import 'package:qismati/core/websocket/websocket.dart';
import 'package:qismati/features/my_profile/bloc/myprofile_bloc.dart';
import 'package:qismati/generated/l10n.dart';
import 'package:qismati/routes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = S.of(context);

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
                    title: localizations.home,
                    // icon: const Icon(Icons.home_outlined),
                    icon: SvgPicture.asset(
                      'assets/images/home_svg.svg',
                      width: 22.h,
                      height: 22.h,
                      fit: BoxFit.contain,
                    ),
                    onTap: () {
                      // retract drawer
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                _buildDrawerItem(
                  _DrawerItem(
                    title: localizations.myProfile,
                    // icon: const Icon(Icons.person_2_outlined),
                    icon: SvgPicture.asset(
                      'assets/images/my_profile_svg.svg',
                      width: 22.h,
                      height: 22.h,
                      fit: BoxFit.contain,
                    ),
                    onTap: () {
                      context.push(Routes.myProfile);
                    },
                  ),
                ),
                _buildDrawerItem(
                  _DrawerItem(
                    title: localizations.profileVisits,
                    icon: SvgPicture.asset(
                      'assets/images/profile_visits.svg',
                      width: 22.h,
                      height: 22.h,
                      fit: BoxFit.contain,
                    ),
                    onTap: () {
                      // retract drawer
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                _buildDrawerItem(
                  _DrawerItem(
                    title: localizations.favoriteList,
                    icon: SvgPicture.asset(
                      'assets/images/favorite_lists.svg',
                      width: 22.h,
                      height: 22.h,
                      fit: BoxFit.contain,
                    ),
                    onTap: () {
                      // retract drawer
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                _buildDrawerItem(
                  _DrawerItem(
                    title: localizations.whoFavoritedMe,
                    // icon: const Icon(Icons.favorite_outline_rounded),
                    icon: SvgPicture.asset(
                      'assets/images/who_favorited_me_svg.svg',
                      width: 22.h,
                      height: 22.h,
                      fit: BoxFit.contain,
                    ),
                    onTap: () {
                      context.push(Routes.favorite);
                    },
                  ),
                ),
                _buildDrawerItem(
                  _DrawerItem(
                    title: localizations.ignoreList,
                    // icon: const Icon(Icons.thumb_down_outlined),
                    icon: Image.asset(
                      'assets/images/ignore_list_png.png',
                      width: 22.h,
                      height: 22.h,
                      fit: BoxFit.contain,
                    ),
                    onTap: () {
                      context.push(Routes.ignore);
                    },
                  ),
                ),
                _buildDrawerItem(
                  _DrawerItem(
                    title: localizations.photoStudio,
                    icon: SvgPicture.asset(
                      'assets/images/photo_studio_svg.svg',
                      width: 22.h,
                      height: 22.h,
                      fit: BoxFit.contain,
                      // color: Colors.black,
                    ),
                    onTap: () {
                      // retract drawer
                      Navigator.of(context).pop();
                    },
                  ),
                ),

                _buildDrawerItem(
                  _DrawerItem(
                    title: localizations.contactUs,
                    // icon: const Icon(Icons.phone_in_talk_sharp),
                    icon: SvgPicture.asset(
                      'assets/images/contact_us_svg.svg',
                      width: 22.h,
                      height: 22.h,
                      fit: BoxFit.contain,
                      // color: Colors.black,
                    ),
                    onTap: () {
                      context.push(Routes.contactUs);
                    },
                  ),
                ),
                _buildDrawerItem(
                  _DrawerItem(
                    title: localizations.aboutUs,
                    // icon: const Icon(Icons.info_outline),
                    icon: SvgPicture.asset(
                      'assets/images/about_us_svg.svg',
                      width: 22.h,
                      height: 22.h,
                      fit: BoxFit.contain,
                      // color: Colors.black,
                    ),
                    onTap: () {
                      context.push(Routes.aboutUs);
                    },
                  ),
                ),
                _buildDrawerItem(
                  _DrawerItem(
                    title: localizations.shareApp,
                    // icon: Transform.rotate(
                    //   angle: -pi /
                    //       2, // Rotate 90 degrees (pi/2 radians counterclockwise)
                    //   child: const Icon(Icons.exit_to_app),
                    // ),
                    icon: SvgPicture.asset(
                      'assets/images/share_app_svg.svg',
                      width: 22.h,
                      height: 22.h,
                      fit: BoxFit.contain,
                      // color: Colors.black,
                    ),
                    onTap: () {},
                  ),
                ),
                _buildDrawerItem(
                  _DrawerItem(
                    title: localizations.settings,
                    // icon: const Icon(Icons.settings_outlined),
                    icon: SvgPicture.asset(
                      'assets/images/settings_svg.svg',
                      width: 22.h,
                      height: 22.h,
                      fit: BoxFit.contain,
                      // color: Colors.black,
                    ),
                    onTap: () {},
                  ),
                ),

                // _buildExpandibleDrawerItem(
                //   _ExpandibleDrawerItem(
                //     title: localizations.settings,
                //     icon: const Icon(Icons.settings_outlined),
                //     onTap: () {},
                //     children: [
                //       _buildDrawerItem(
                //         _DrawerItem(
                //           title: localizations.accountInformation,
                //           icon: const Icon(Icons.info_outlined),
                //           onTap: () {
                //             context.push(Routes.accountInformationScreen);
                //           },
                //         ),
                //       ),
                //       _buildDrawerItem(
                //         _DrawerItem(
                //           title: localizations.profileSettings,
                //           icon: const Icon(Icons.settings_outlined),
                //           onTap: () {
                //             context.push(Routes.accountSettings);
                //           },
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(height: 80.h),
                _buildDrawerLogOutItem(
                  _DrawerItem(
                    title: localizations.signOut,
                    icon: const Icon(
                      Icons.exit_to_app,
                      color: CustomColors.signOutRed,
                    ),
                    onTap: () async {
                      // The result variable is used to track user choice from alert.
                      final bool result = await CustomAlertDialog.show(
                        context,
                        title: localizations.confirmationTitle,
                        content: localizations.signOutConfirmation,
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                width: 100.w,
                                isInverted: true,
                                onPressed: () => context.pop(false),
                                text: localizations.no,
                                fontWeight: FontWeight.w600,
                                shadowColor: CustomColors.shadowBlue,
                              ),
                              CustomButton(
                                width: 100.w,
                                onPressed: () => context.pop(true),
                                text: localizations.yes,
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
                        context.go(Routes.loginWithPassword);
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
      // children: option.children!,
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
                  Text(S.of(context).unableToLoadProfile),
                  TextButton(
                    onPressed: () {
                      bloc.add(LoadMyProfile());
                    },
                    child: Text(S.of(context).retryButton),
                  ),
                ],
              ),
            );

          default:
            // Any unimplemented state for Myprofile goes here
            return Center(
              child: Text('${S.of(context).unimplementedState} $state'),
            );
        }
      },
    );
  }

  Widget _profileWidget(ProfileModel profile) {
    return Container(
      padding: const EdgeInsets.all(10),
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: CustomColors.primary,
      //     width: 1,
      //   ),
      //   borderRadius: BorderRadius.circular(10),
      // ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile image with constraints
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: CustomColors.primary,
                width: 1,
              ),
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
          SizedBox(width: 10.w),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      profile.fullName,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                    SizedBox(width: 4.w),
                    SvgPicture.asset(
                      'assets/images/premium_icon_svg_for_profile.svg',
                      width: 22.h,
                      height: 22.h,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                // SizedBox(height: 4.h),
                // Text(
                //   profile.userName,
                //   style: TextStyle(
                //     fontSize: 12.sp,
                //     color: CustomColors.textGray,
                //     overflow: TextOverflow.ellipsis,
                //   ),
                //   maxLines: 1,
                // ),
                Text(
                  'Premium',
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
  // final List<Widget>? children;
  final Widget? trailingIcon;

  _ExpandibleDrawerItem({
    required this.title,
    required this.icon,
    required this.onTap,
    // ignore: unused_element
    this.trailingIcon,
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
