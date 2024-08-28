import 'package:get/get.dart';
import '../ui/pages/auth/register.dart';
import '../ui/pages/forgot_password.dart';
import '../ui/pages/home/home.dart';
import '../ui/pages/initial.dart';
import '../ui/pages/otp.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => const Initial(),
      transition: Transition.zoom,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: '/otp',
      page: () => const Otp(),
      transition: Transition.zoom,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: '/forgot_password',
      page: () => const ForgotPassword(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: '/register',
      page: () => const Register(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: '/home',
      page: () => const Home(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
