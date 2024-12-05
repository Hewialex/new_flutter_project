import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/core/database/database_helper.dart';
import 'package:qismati/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () async {
      final DatabaseHelper databaseHelper =
          RepositoryProvider.of<DatabaseHelper>(context);
      final sessionExists = await databaseHelper.getSession();

      if (!mounted) {
        return;
      }
      if (sessionExists) {
        context.go(Routes.login);
      } else {
        context.go(Routes.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'assets/images/splash_screen_logo.svg',
          width: 235.w,
          height: 124.h,
        ),
      ),
    );
  }
}
