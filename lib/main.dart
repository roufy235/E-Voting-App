import 'package:dynamic_color/dynamic_color.dart';
import 'package:e_voting_app/screens/login/login_screen.dart';
import 'package:e_voting_app/screens/welcome/welcome_screen.dart';
import 'package:e_voting_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);


  final GoRouter _router = GoRouter(
    initialLocation: WelcomeScreen.routeName,
    routes: [
      GoRoute(
        path: WelcomeScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const WelcomeScreen();
        },
        routes: [
          GoRoute(
            path: LoginScreen.routeName,
            builder: (BuildContext context, GoRouterState state) => const LoginScreen()
          )
        ]
      ),
    ]
  );

  // This widget is the root of your application.
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
                  primary: brandColor,
                  onPrimary: colorWhite,
                )
            ),
            useMaterial3: true,
            colorScheme: lightColorScheme,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).primaryTextTheme),
          ),
          routeInformationProvider: _router.routeInformationProvider,
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
        );
      }
    );
  }
}
