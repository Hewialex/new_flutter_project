import 'package:go_router/go_router.dart';
import 'package:qismati/features/auth/screens/forgot_password_screen.dart';
import 'package:qismati/features/auth/screens/login_screen.dart';
import 'package:qismati/features/home/screens/home_screen.dart';
import 'package:qismati/features/onboarding/screens/onboarding_screen.dart';
import 'package:qismati/features/onboarding/screens/register_screen.dart';
import 'package:qismati/features/onboarding/screens/splash_screen.dart';

final GoRouter goRouter = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
  GoRoute(
    path: '/onboarding',
    builder: (context, state) => const OnboardingScreen(),
  ),
  GoRoute(
    path: '/register',
    builder: (context, state) => const RegisterScreen(),
  ),
  GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
  GoRoute(
    path: '/forgotPassword',
    builder: (context, state) => const ForgotPasswordScreen(),
  ),
  GoRoute(path: '/home', builder: (context, state) => HomeScreen())
]);
