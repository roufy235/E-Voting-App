import 'package:dynamic_color/dynamic_color.dart';
import 'package:e_voting_app/firebase_options.dart';
import 'package:e_voting_app/screens/home/main_screen.dart';
import 'package:e_voting_app/screens/login/login_screen.dart';
import 'package:e_voting_app/screens/reg/init_reg_screen.dart';
import 'package:e_voting_app/screens/reg/reg_screen.dart';
import 'package:e_voting_app/screens/welcome/welcome_screen.dart';
import 'package:e_voting_app/utils/colors.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ScreenUtil.ensureScreenSize();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  final FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);
  final FirebasePerformance _firebasePerformance = FirebasePerformance.instance;


  final GoRouter _router = GoRouter(
    initialLocation: WelcomeScreen.routeName,
    routes: [
      GoRoute(
          path: '/${MainScreen.routeName}',
          builder: (BuildContext context, GoRouterState state) => const MainScreen()
      ),
      GoRoute(
        path: WelcomeScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const WelcomeScreen();
        },
        routes: [
          GoRoute(
            path: LoginScreen.routeName,
            builder: (BuildContext context, GoRouterState state) => LoginScreen()
          ),
          GoRoute(
              path: InitRegScreen.routeName,
              builder: (BuildContext context, GoRouterState state) => const InitRegScreen(),
            routes: [
              GoRoute(
                  path: RegScreen.routeName,
                  builder: (BuildContext context, GoRouterState state) => const RegScreen()
              )
            ]
          )
        ]
      ),
    ]
  );

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        if (lightDynamic != null && darkDynamic != null) {
          lightColorScheme = lightDynamic.harmonized()..copyWith();
          lightColorScheme = lightColorScheme.copyWith(secondary: brandColor);
          darkColorScheme = darkDynamic.harmonized();
        } else {
          lightColorScheme = ColorScheme.fromSeed(seedColor: brandColor);
          darkColorScheme = ColorScheme.fromSeed(seedColor: brandColor, brightness: Brightness.dark);
        }

        lightColorScheme = ColorScheme.fromSeed(seedColor: brandColor);
        darkColorScheme = ColorScheme.fromSeed(seedColor: brandColor, brightness: Brightness.dark);

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  primary: lightColorScheme.primary,
                  onPrimary: lightColorScheme.onPrimary,
                )
            ),
            useMaterial3: true,
            colorScheme: lightColorScheme,
            textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
            textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).primaryTextTheme),
          ),
          routeInformationProvider: _router.routeInformationProvider,
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
        );
      }
    );
  }
}
