import 'package:e_voting_app/router/app_screens.dart';
import 'package:e_voting_app/router/app_screens_ext.dart';
import 'package:e_voting_app/screens/home/main_screen.dart';
import 'package:e_voting_app/screens/login/login_screen.dart';
import 'package:e_voting_app/screens/reg/init_reg_screen.dart';
import 'package:e_voting_app/screens/reg/reg_screen.dart';
import 'package:e_voting_app/screens/welcome/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    initialLocation: '/${AppScreens.welcome.toPath}',
    refreshListenable: GoRouterRefreshStream(FirebaseAuth.instance.authStateChanges()),
    routes: <GoRoute> [
      GoRoute(
          path: '/${AppScreens.home.toPath}',
          name: AppScreens.home.toName,
          builder: (BuildContext context, GoRouterState state) => const MainScreen()
      ),
      GoRoute(
          path: '/${AppScreens.welcome.toPath}',
          name: AppScreens.welcome.toName,
          builder: (BuildContext context, GoRouterState state) {
            return const WelcomeScreen();
          },
          routes: [
            GoRoute(
                path: AppScreens.login.toPath,
                name: AppScreens.login.toName,
                builder: (BuildContext context, GoRouterState state) => const LoginScreen()
            ),
            GoRoute(
                path: AppScreens.initReg.toPath,
                name: AppScreens.initReg.toName,
                builder: (BuildContext context, GoRouterState state) => const InitRegScreen(),
                routes: [
                  GoRoute(
                      path: AppScreens.reg.toPath,
                      name: AppScreens.reg.toName,
                      builder: (BuildContext context, GoRouterState state) => const RegScreen()
                  )
                ]
            )
          ]
      ),
    ],
    redirect: (GoRouterState state) {
      final loginLocation = state.namedLocation(AppScreens.login.toPath);
      final isGoingLoginLocation = state.subloc == loginLocation.replaceAll('?', '');

      final homeLocation = state.namedLocation(AppScreens.home.toPath);
      final isGoingHomeLocation = state.subloc == homeLocation.replaceAll('?', '');

      final welcomeLocation = state.namedLocation(AppScreens.welcome.toPath);
      final isGoingWelcomeLocation = state.subloc == welcomeLocation.replaceAll('?', '');
      User? currentUser = FirebaseAuth.instance.currentUser;
      bool isLoggedIn = currentUser != null;

      if (isLoggedIn && isGoingWelcomeLocation) {
        return homeLocation;
      }

      if (!isLoggedIn && isGoingHomeLocation) {
        return welcomeLocation;
      }

      if (isLoggedIn && isGoingLoginLocation) {
        return homeLocation;
      }
      return null;
    }
  );
}
