import 'package:go_router/go_router.dart';
import 'package:qismati/features/aboutus/screens/aboutus_screen.dart';
import 'package:qismati/features/auth/screens/forgot_password_screen.dart';
import 'package:qismati/features/auth/screens/login_screen.dart';
import 'package:qismati/features/auth/screens/login_with_password_screen.dart';
import 'package:qismati/features/auth/screens/new_password_screen.dart';
import 'package:qismati/features/chat/screens/chat_screen.dart';
import 'package:qismati/features/chat/screens/chat_list_screen.dart';
import 'package:qismati/features/contactus/screens/contactus_screen.dart';
import 'package:qismati/features/home/screens/home_screen.dart';
import 'package:qismati/features/interactions/screens/favorite_list_screen.dart';
import 'package:qismati/features/members/screens/members_photo_screen.dart';
import 'package:qismati/features/my_profile/screens/my_profile_screen.dart';
import 'package:qismati/features/nearyou/screens/nearyou_screen.dart';
import 'package:qismati/features/new_members/screens/new_members_screen.dart';
import 'package:qismati/features/notification/screens/notification_screen.dart';
import 'package:qismati/features/onboarding/screens/onboarding_screen.dart';
import 'package:qismati/features/onboarding/screens/register_screen.dart';
import 'package:qismati/features/onboarding/screens/splash_screen.dart';
import 'package:qismati/features/search/screens/search_screen.dart';
import 'package:qismati/features/signup/screens/signup_screen.dart';
import 'package:qismati/routes.dart';

final GoRouter goRouter = GoRouter(routes: [
  GoRoute(
      path: Routes.initRoute,
      builder: (context, state) => const SplashScreen()),
  GoRoute(
    path: Routes.onboarding,
    builder: (context, state) => const OnboardingScreen(),
  ),
  GoRoute(
    path: Routes.register,
    builder: (context, state) => const RegisterScreen(),
  ),
  GoRoute(path: Routes.login, builder: (context, state) => const LoginScreen()),
  GoRoute(
    path: Routes.forgotPassword,
    builder: (context, state) => const ForgotPasswordScreen(),
  ),
  GoRoute(
    path: Routes.newPassword,
    builder: (context, state) => const NewPasswordScreen(),
  ),
  GoRoute(path: Routes.home, builder: (context, state) => HomeScreen()),
  GoRoute(
    path: Routes.signup,
    builder: (context, state) {
      final gender = state.extra as String;
      return SignupScreen(gender: gender);
    },
  ),
  GoRoute(
    path: Routes.messages,
    builder: (context, state) => const ChatListScreen(),
  ),
  GoRoute(
    path: Routes.chat,
    builder: (context, state) => const ChatScreen(),
  ),
  GoRoute(
    path: Routes.premium,
    builder: (context, state) => const NewMembersScreen(),
  ),
  GoRoute(
    path: Routes.loginWithPassword,
    builder: (context, state) => const LoginWithPasswordScreen(),
  ),
  GoRoute(
    path: Routes.aboutUs,
    builder: (context, state) => const AboutusScreen(),
  ),
  GoRoute(
    path: Routes.nearYouScreen,
    builder: (context, state) => NearYouScreen(),
  ),
  GoRoute(
    path: Routes.myProfile,
    builder: (context, state) => const MyProfileScreen(),
  ),
  GoRoute(
    path: Routes.contactUs,
    builder: (context, state) => const ContactUsScreen(),
  ),
  GoRoute(
    path: Routes.notification,
    builder: (context, state) => const NotificationScreen(),
  ),
  GoRoute(
    path: Routes.membersPhoto,
    builder: (context, state) => const MembersPhotoScreen(),
  ),
  GoRoute(
    path: Routes.searchScreen,
    builder: (context, state) => const SearchScreen(),
  ),
  GoRoute(
    path: Routes.favorite,
    builder: (context, state) => const FavoriteListScreen(),
  ),
]);
