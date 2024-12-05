import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/core/database/database_helper.dart';
import 'package:qismati/core/websocket/websocket.dart';
import 'package:qismati/features/auth/blocs/login_bloc.dart';
import 'package:qismati/features/auth/blocs/login_status_bloc.dart';
import 'package:qismati/features/chat/bloc/chat_bloc.dart';
import 'package:qismati/features/my_profile/bloc/myprofile_bloc.dart';
import 'package:qismati/features/nearyou/blocs/nearyou_bloc.dart';
import 'package:qismati/features/auth/blocs/signup_bloc.dart';
import 'package:qismati/features/new_members/bloc/new_member_bloc.dart';
import 'package:qismati/features/notification/bloc/notification_bloc.dart';
import 'package:qismati/features/online_members/bloc/online_member_bloc.dart';
import 'package:qismati/features/premium_members/bloc/premium_member_bloc.dart';
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
              RepositoryProvider<DatabaseHelper>(
                create: (context) => DatabaseHelper(),
              ),
              RepositoryProvider<WebsocketService>(
                create: (context) => WebsocketService(),
              ),
              RepositoryProvider<NotificationBloc>(
                create: (context) => NotificationBloc(),
              ),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider<NotificationBloc>(
                  create: (context) => NotificationBloc(),
                ),
                BlocProvider<LoginBloc>(
                  create: (context) => LoginBloc(
                    notificationBloc: context.read<NotificationBloc>(),
                    databaseHelper: context.read<DatabaseHelper>(),
                    websocketService: context.read<WebsocketService>(),
                  ),
                ),
                BlocProvider<SignupBloc>(create: (context) => SignupBloc()),
                BlocProvider<LoginStatusBloc>(
                  create: (context) => LoginStatusBloc(
                      websocketService: context.read<WebsocketService>(),
                      notificationBloc: context.read<NotificationBloc>()),
                ),
                BlocProvider<ChatBloc>(create: (context) => ChatBloc()),
                BlocProvider<SignupBloc>(create: (context) => SignupBloc()),
                BlocProvider<NearYouBloc>(create: (context) => NearYouBloc()),
                BlocProvider<NewMemberBloc>(
                  create: (context) => NewMemberBloc(
                    databaseHelper: context.read<DatabaseHelper>(),
                  ),
                ),
                BlocProvider<OnlineMemberBloc>(
                  create: (context) => OnlineMemberBloc(
                    databaseHelper: context.read<DatabaseHelper>(),
                  ),
                ),
                BlocProvider<PremiumMemberBloc>(
                  create: (context) => PremiumMemberBloc(
                    databaseHelper: context.read<DatabaseHelper>(),
                  ),
                ),
                BlocProvider<MyprofileBloc>(
                    create: (context) => MyprofileBloc()),
              ],
              child: widget!,
            ),
          );
        },
      ),
    );
  }
}
