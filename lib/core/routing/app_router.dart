import 'package:appointement_booking_app/core/routing/routes.dart';
import 'package:appointement_booking_app/features/login/presentaion/ui/login_screen.dart';
import 'package:appointement_booking_app/features/on_boarding/presentaion/ui/on_boarding_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.onBoardingScreen,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: Routes.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
}
