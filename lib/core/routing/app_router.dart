import 'package:appointement_booking_app/core/di/dependancy_injection.dart';
import 'package:appointement_booking_app/core/routing/routes.dart';
import 'package:appointement_booking_app/features/home/presentaion/ui/homw_screen.dart';
import 'package:appointement_booking_app/features/login/presentaion/ui/login_screen.dart';
import 'package:appointement_booking_app/features/on_boarding/presentaion/ui/on_boarding_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/login/presentaion/logic/login_cubit/login_cubit.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.onBoardingScreen,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: Routes.loginScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<LogincubitCubit>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: Routes.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
