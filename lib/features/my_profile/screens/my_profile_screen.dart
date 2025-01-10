import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/models/profile.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/features/my_profile/bloc/myprofile_bloc.dart';
import 'package:qismati/features/my_profile/screens/my_profile_editing_screen.dart';
import 'package:qismati/features/profile/widgets/profile_info.dart';

class MyProfileDashBoardDisplay extends StatelessWidget {
  const MyProfileDashBoardDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MyprofileBloc>();
    bloc.add(LoadMyProfile());

    return BlocBuilder<MyprofileBloc, MyprofileState>(builder: (context, state) {
      if (state is MyprofileInitial) {
        bloc.add(LoadMyProfile());
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is MyprofileLoading) {
        return (state.profile != null)
            ? _buildProfileInfo(
                context: context,
                profile: state.profile!,
                isLoading: true,
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      } else if (state is MyprofileSuccess) {
        return _buildProfileInfo(
          context: context,
          profile: state.profile,
          isLoading: false,
        );
      } else if (state is MyprofileError) {
        return Center(
          child: Column(
            children: [
              const Text("Error loading profile"),
              IconButton(
                onPressed: () {
                  bloc.add(LoadMyProfile());
                },
                icon: const Icon(
                  Icons.refresh,
                  color: CustomColors.secondaryBackground,
                ),
                tooltip: "Refresh",
              )
            ],
          ),
        );
      } else if (state is MyprofileUpdateError) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Error Updating Profile : ${state.message}"),
              backgroundColor: CustomColors.error,
              duration: const Duration(seconds: 3),
            ),
          );
        });
        return Center(
          child: _buildProfileInfo(context: context, profile: state.profile),
        );
      } else {
        return const Center(
          child: Text("Unknown state"),
        );
      }
    });
  }

  Widget _buildProfileInfo({
    required BuildContext context,
    required ProfileModel profile,
    bool isLoading = false,
  }) {
    return Stack(
      children: [
        Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: CustomColors.background,
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  ),
                  margin: EdgeInsets.only(
                      top: 100.h, left: 20.w, right: 20.w, bottom: 50.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                  child: Column(
                    children: [
                      // name
                      Text(
                        profile.fullName,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildActionIcon(Icons.share, 'Share'),
                          _buildActionIcon(
                            Icons.edit,
                            'Edit',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileEditingScreen(
                                    profile: profile,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // registration data table
                      ProfileInfo(
                        tableName: "Registration data",
                        tableData: {
                          "Registration since": DateTime.now()
                              .difference(profile.createdAt)
                              .inDays
                              .toString(),
                          "Last login data": "-",
                        },
                      ),

                      const SizedBox(height: 20),

                      // info card table
                      ProfileInfo(
                        tableName: "Info Card",
                        tableData: {
                          "Nationality": profile.nationality,
                          "Place of residence": profile.country,
                          "City": profile.city,
                          "Marriage type": profile.marriageType,
                          "Marital status": profile.maritalStatus,
                          "Age": profile.age,
                          "Child Count": profile.children,
                          "Weight - Height":
                              "${profile.height} - ${profile.weight}cm",
                          "Skin Color": profile.skinColor,
                          "Body Shape": profile.bodyShape,
                          "Job": profile.job,
                          "Education qualification":
                              profile.educationalQualification,
                          "Financial Status": profile.financialStatus,
                          "Monthly income": profile.monthlyIncome,
                          "Health Case": profile.healthCase,
                          "Religious commitment": profile.religiousCommitment,
                          profile.gender == "Female" ? "Veil" : "Beard":
                              profile.gender == "Female"
                                  ? profile.viel
                                  : profile.beard,
                        },
                      ),

                      const SizedBox(height: 20),

                      ProfileInfo(
                        tableName: "About my ideal partner",
                        data: profile.aboutYourPartner,
                      ),

                      const SizedBox(height: 20),

                      ProfileInfo(
                        tableName: "About me",
                        data: profile.aboutYourSelf,
                      ),

                      const SizedBox(height: 50),

                      CustomButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: "Close",
                      ),
                    ],
                  ),
                ),

                // avatar image
                Positioned(
                  top: -1,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
                    child: Column(
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 55.r,
                            backgroundImage: AssetImage(
                                (profile.gender == "female")
                                    ? "assets/images/female_avatar.png"
                                    : "assets/images/male_avatar.png"),
                            backgroundColor: CustomColors.background,
                          ),
                        ),
                        SizedBox(height: 15.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        // Loading overlay
        if (isLoading)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
              child: const Center(
                child: CupertinoActivityIndicator(
                  color: CustomColors.secondaryBackground,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildActionIcon(
    IconData icon,
    String label, {
    Function()? onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: CustomColors.primary,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(10),
              child: Icon(icon, color: CustomColors.background),
            ),
            SizedBox(height: 5.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                color: CustomColors.textGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MyprofileBloc>();
    bloc.add(LoadMyProfile());

    return Scaffold(
      backgroundColor: CustomColors.primary,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: CustomColors.primary,
        iconTheme: const IconThemeData(
          color: CustomColors.background,
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: CustomColors.background,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
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
                Icons.notifications_outlined,
                color: CustomColors.background,
              ),
            ),
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: MyProfileDashBoardDisplay(),
      ),
    );
  }

  // Helper to build action buttons
}
