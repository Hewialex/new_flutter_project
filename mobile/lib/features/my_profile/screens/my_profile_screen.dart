import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/features/profile/widgets/profile_info.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
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
                      const Text(
                        "Alisha",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildActionIcon(Icons.share, 'Share'),
                          _buildActionIcon(Icons.edit, 'Edit'),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // registration data table
                      const ProfileInfo(
                        tableName: "Registration data",
                        tableData: {
                          "Registration since": "7 days ago",
                          "Last login data": "Online now",
                        },
                      ),

                      const SizedBox(height: 20),

                      // info card table
                      const ProfileInfo(
                        tableName: "Info Card",
                        tableData: {
                          "Nationality": "Pakistan",
                          "Place of residence": "Islamabad",
                          "City": "F11",
                          "Marriage type": "One husband",
                          "Marital status": "Single",
                          "Age": "20",
                          "Child Count": "0",
                          "Weight - Height": "55 - 153cm",
                          "Skin Color": "White",
                          "Body Shape": "Medium shape",
                          "Job": "None",
                          "Education qualification": "University student",
                          "Financial Status": "Middle",
                          "Monthly income": "10,000",
                          "Health Case": "Healthy",
                          "Religious commitment": "Religious",
                          "Veil": "Veiled",
                        },
                      ),

                      const SizedBox(height: 20),

                      const ProfileInfo(
                        tableName: "About my ideal partner",
                        data: "I am looking for ...",
                      ),

                      const SizedBox(height: 20),

                      const ProfileInfo(
                        tableName: "About me",
                        data: "I am the kind of person that ...",
                      ),

                      const SizedBox(height: 50),

                      CustomButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: "Close")
                    ],
                  ),
                ),
                // avatar imaage
                Positioned(
                  top: -1,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
                    child: Column(
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius:
                                55.r, // Use 55 based on your provided design
                            backgroundImage: const AssetImage(
                                "assets/images/female_avatar.png"), // Replace with actual image
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
      ),
    );
  }

  // Helper to build action buttons
  Widget _buildActionIcon(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: CustomColors.primary, shape: BoxShape.circle),
            padding: const EdgeInsets.all(10),
            child: Icon(icon, color: CustomColors.background),
          ),
          SizedBox(height: 5.h),
          Text(
            label,
            style: TextStyle(fontSize: 14.sp, color: CustomColors.textGray),
          ),
        ],
      ),
    );
  }
}
