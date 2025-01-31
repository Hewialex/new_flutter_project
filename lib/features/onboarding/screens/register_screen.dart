import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/core/database/database_helper.dart';
import 'package:qismati/generated/l10n.dart';
import 'package:qismati/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum OathSelection { none, taken }

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  OathSelection _oathSelection = OathSelection.none;
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  @override
  Widget build(BuildContext context) {
    final localizations = S.of(context);
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
                  localizations.register,
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
<<<<<<< HEAD
                        'Assalamu Alaikum Wa Rahmatullahi',
=======
                        localizations.assalamuAlaikum,
>>>>>>> 2c5acc9482ec94017dc8314a69712e5f38593f99
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
                        localizations.freeOfCharge,
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
                  text: localizations.takeOath,
                ),
                SizedBox(height: 28.h),
                SizedBox(
                  width: 299.w,
                  child: Column(
                    children: [
                      Text(
                        localizations.oathText,
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
                          localizations.termsAndConditionsApp,
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
                  localizations.allahWitness,
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
                    localizations.takenOath,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  leading: Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: CustomColors.primary, // Custom color for unselected state
                    ),
                    child: Radio<OathSelection>(
                      value: OathSelection.taken,
                      groupValue: _oathSelection,
                      activeColor: CustomColors.primary, // Custom color for selected state
                      onChanged: (value) {
                        setState(() {
                          _oathSelection = value ?? OathSelection.none;
                        });
                      },
                    ),
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
                  text: localizations.iAmMale,
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
                  text: localizations.iAmFemale,
                  isInverted: !isFemaleSelected,
                ),
                (_oathSelection == OathSelection.taken &&
                        (isFemaleSelected || isMaleSelected))
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

                            context.push(Routes.signup, extra: gender);
                          }
                        },
                        child: Text(localizations.continue_action))
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
