import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/features/auth/blocs/login_bloc.dart';
import 'package:qismati/features/chat/bloc/chat_bloc.dart';
import 'package:qismati/routing.dart';

class QismatiApp extends StatelessWidget {
  const QismatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp.router(
        title: 'Qismati',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: goRouter,
        builder: (context, widget) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
              BlocProvider<ChatBloc>(create: (context) => ChatBloc()),
            ],
            child: widget!,
          );
        },
      ),
    );
  }
}
