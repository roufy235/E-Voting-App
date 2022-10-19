import 'package:evoting/router/app_screens.dart';

extension AppScreensExtension on AppScreens {
  String get toPath {
    switch(this) {
      case AppScreens.onBoarding: return 'onBoarding';
      case AppScreens.signUp: return 'signUp';
    }
  }

  String get toName {
    switch(this) {
      case AppScreens.onBoarding: return 'onBoarding';
      case AppScreens.signUp: return 'signUp';
    }
  }
}
