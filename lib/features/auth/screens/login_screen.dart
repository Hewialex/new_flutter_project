// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:qismati/common/colors.dart';
// import 'package:qismati/common/widgets/custom_button.dart';
// import 'package:qismati/common/widgets/custom_header.dart';
// import 'package:qismati/common/widgets/custom_top_bar.dart';
// import 'package:qismati/core/database/database_helper.dart';
// import 'package:qismati/features/auth/blocs/login_status_bloc.dart';
// import 'package:qismati/features/auth/widgets/content_container.dart';
// import 'package:qismati/routes.dart';
// import 'package:qismati/generated/l10n.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final bloc = context.watch<LoginStatusBloc>();
//     final state = bloc.state;

//     bloc.add(LoginStatusCheck());

//     switch (state) {
//       case LoginStatusInitial():
//         bloc.add(LoginStatusCheck());
//         return const Scaffold(
//           backgroundColor: CustomColors.background,
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Center(
//                 child: CupertinoActivityIndicator(
//                   color: CustomColors.primary,
//                 ),
//               ),
//               Text(
//                 "Please wait...",
//                 style: TextStyle(
//                   color: CustomColors.primary,
//                 ),
//               )
//             ],
//           ),
//         );
//       case LoginStatusSuccess():
//         Future.microtask(() {
//           if (context.mounted) {
//             context.go(Routes.home);
//           }
//         });
//         return const Scaffold(
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.done,
//                   color: CustomColors.chatName,
//                   size: 50,
//                 ),

//                 // a success message
//                 Text(
//                   "User already logged in",
//                   style: TextStyle(
//                     color: CustomColors.success,
//                     fontSize: 20,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       case LoginStatusDefault():
//         return Scaffold(
//           backgroundColor: CustomColors.background,
//           body: SafeArea(
//             child: SingleChildScrollView(
//               child: ContentContainer(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const CustomTopBar(
//                       altRoute: Routes.register,
//                       excludeLangDropDown: true,
//                     ),
//                     SizedBox(height: 47.h),
//                     CustomHeader(text: S.of(context).signIn),
//                     Text(
//                       S.of(context).interactWithHappiness,
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 15.sp,
//                       ),
//                     ),
//                     SizedBox(height: 175.h),
//                     CustomButton(
//                       onPressed: () {
//                         context.push(Routes.loginWithPassword);
//                       },
//                       text: S.of(context).continueWithEmail,
//                       shadowColor: CustomColors.shadowBlue,
//                       elevation: 5,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     SizedBox(height: 30.h),
//                     CustomButton(
//                       onPressed: () {
//                         //
//                       },
//                       text: S.of(context).continueWithGoogle,
//                       shadowColor: CustomColors.shadowBlue,
//                       elevation: 5,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     SizedBox(height: 30.h),
//                     const Text("or"),
//                     SizedBox(height: 30.h),
//                     TextButton(
//                       onPressed: () async {
//                         final DatabaseHelper databaseHelper =
//                             RepositoryProvider.of<DatabaseHelper>(context);
//                         final gender = await databaseHelper.getGender();

//                         if (context.mounted) {
//                           context.push(Routes.signup, extra: gender);
//                         }
//                       },
//                       child: Text(
//                         S.of(context).createAccount,
//                         style: TextStyle(
//                           fontSize: 12.sp,
//                           fontWeight: FontWeight.w600,
//                           color: CustomColors.textBlack,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 30.h),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       default:
//         return Scaffold(
//           body: Center(
//             child: Text(S.of(context).unimplementedState),
//           ),
//         );
//     }
//   }
// }
