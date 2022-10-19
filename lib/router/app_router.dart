import 'package:evoting/router/app_screens.dart';
import 'package:evoting/router/app_screens_ext.dart';
import 'package:evoting/screens/on_boarding/on_boarding_screen.dart';
import 'package:evoting/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    initialLocation: '/${AppScreens.signUp.toPath}',
    routes: <GoRoute>[
      GoRoute(
        path: '/${AppScreens.onBoarding.toPath}',
        name: AppScreens.onBoarding.toName,
        builder: (BuildContext context, GoRouterState state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: '/${AppScreens.signUp.toPath}',
        name: AppScreens.signUp.toName,
        builder: (BuildContext context, GoRouterState state) => const SignUpScreen(),
      ),
    ]
  );
}
