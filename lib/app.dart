import 'package:evoting/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'config/config.dart';

final GoRouter _goRouter = AppRouter().router;

class MyEvotingApp extends StatelessWidget {
  const MyEvotingApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ColorScheme lightColorScheme = ColorScheme.fromSeed(seedColor: kPrimaryColor);
    ColorScheme darkColorScheme = ColorScheme.fromSeed(seedColor: kPrimaryDColor, brightness: Brightness.dark);
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerDelegate: _goRouter.routerDelegate,
      routeInformationParser: _goRouter.routeInformationParser,
      routeInformationProvider: _goRouter.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: lightColorScheme.surface,
        dialogBackgroundColor: lightColorScheme.surface,
        useMaterial3: true,
        colorScheme: lightColorScheme,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: kPrimaryColor,
            foregroundColor: kPrimaryColor
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              backgroundColor: kPrimaryColor,
              foregroundColor: lightColorScheme.onPrimary,
            )
        ),
        textButtonTheme: TextButtonThemeData(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              foregroundColor: kPrimaryColor,
            )
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              //backgroundColor: brandColor,
              side: BorderSide(width: 1.0, color: lightColorScheme.primary, style: BorderStyle.solid,),
            )
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: lightColorScheme.surface,
          //foregroundColor: colorWhite,
          elevation: 0,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: kBlackDColor,
        dialogBackgroundColor: kBlackDFadedColor,
        useMaterial3: true,
        colorScheme: darkColorScheme,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: kPrimaryDColor,
            foregroundColor: kPrimaryDColor
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              backgroundColor: kPrimaryDColor,
              foregroundColor: lightColorScheme.onPrimary,
            )
        ),
        textButtonTheme: TextButtonThemeData(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              foregroundColor: kPrimaryDColor,
            )
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              //backgroundColor: brandColor,
              side: BorderSide(width: 1.0, color: lightColorScheme.primary, style: BorderStyle.solid,),
            )
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: kBlackDFadedColor,
          //foregroundColor: colorWhite,
          elevation: 0,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
    );
  }
}
