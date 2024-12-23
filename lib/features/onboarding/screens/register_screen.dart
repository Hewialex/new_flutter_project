import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/core/database/database_helper.dart';
import 'package:qismati/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isSelected = false;
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: Center(
          child: Container(
            width: 335.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(30.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 42.h),
                Text(
                  'Register',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 35.h),
                SizedBox(
                  width: 295.w,
                  height: 76.h,
                  child: Column(
                    children: [
                      Text(
                        'Assalamu alaikum wa rahmatullahi',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.sp,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w300,
                          decorationColor: Colors.red,
                        ),
                      ),
                      SizedBox(height: 14.h),
                      Text(
                        'To allow all member the opportunity to register for Qismiati, it is free of charge.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 18.h),
                CustomButton(
                  onPressed: () {},
                  width: 280,
                  fontSize: 12,
                  height: 46,
                  text: 'Please take an oath before registering',
                ),
                SizedBox(height: 28.h),
                SizedBox(
                  width: 299.w,
                  child: Column(
                    children: [
                      Text(
                        'I swear by ALLAH Almighty that I will not enter this App except for the purpose of legal marriage, and not for any other purpose . I promise ALLAH and I promise you  that I will not waste the hard work of the App , and that I will not deceive the members, and that I will be honest with ALLAH and then with my self, and that I will abide by.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style:
                            TextButton.styleFrom(foregroundColor: Colors.red),
                        child: Text(
                          'The terms and conditions of the App',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'ALLAH is the best witness',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 40.h),
                ListTile(
                  title: Text(
                    "I've taken an oath",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  leading: Radio(
                    value: true,
                    groupValue: isSelected,
                    activeColor: CustomColors.primary,
                    onChanged: (value) {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                  ),
                ),
                SizedBox(height: 18.h),
                CustomButton(
                  width: 280,
                  height: 41,
                  onPressed: () {
                    setState(() {
                      isMaleSelected = true;
                      isFemaleSelected = false;
                    });
                  },
                  text: "I'm Male",
                  isInverted: !isMaleSelected,
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  width: 280,
                  height: 41,
                  onPressed: () {
                    setState(() {
                      isFemaleSelected = true;
                      isMaleSelected = false;
                    });
                  },
                  text: "I'm Female",
                  isInverted: !isFemaleSelected,
                ),
                (isSelected && (isFemaleSelected || isMaleSelected))
                    ? TextButton(
                        onPressed: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          final gender = isMaleSelected ? "Male" : "Female";
                          prefs.setString('gender', gender);

                          if (context.mounted) {
                            final DatabaseHelper databaseHelper =
                                RepositoryProvider.of<DatabaseHelper>(context);
                            databaseHelper.saveSession(gender);

                            context.push(Routes.login);
                          }
                        },
                        child: const Text('Continue'))
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
