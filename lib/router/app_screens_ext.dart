import 'package:e_voting_app/router/app_screens.dart';

extension AppScreensExtension on AppScreens {
  String get toPath {
    switch(this) {
      case AppScreens.welcome: return 'welcome';
      case AppScreens.home: return 'home';
      case AppScreens.initReg: return 'initReg';
      case AppScreens.login: return 'login';
      case AppScreens.reg: return 'reg';
      default: return '/';
    }
  }

  String get toName {
    switch(this) {
      case AppScreens.welcome: return 'WELCOME';
      case AppScreens.home: return 'HOME';
      case AppScreens.login: return 'LOGIN';
      case AppScreens.reg: return 'REGISTRATION';
      case AppScreens.initReg: return 'InitRegistration';
      default: return 'WELCOME';
    }
  }

  String get toTitle {
    switch(this) {
      case AppScreens.welcome: return 'WELCOME';
      case AppScreens.home: return 'HOME';
      case AppScreens.login: return 'LOGIN';
      case AppScreens.reg: return 'REGISTRATION';
      case AppScreens.initReg: return 'InitRegistration';
      default: return 'WELCOME';
    }
  }
}
