import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recyclex/presentation/screens/home_page.dart';

import '../presentation/screens/auth_screen.dart';
import '../presentation/screens/finish_auth.dart';

class RouteNames {
  static const String authRoute = '/auth';
  static const String finishAuthRoute = '/finish_auth';
  static const String homeRoute = '/home';
}

class AppRouter {
  static Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.authRoute:
        return _smoothTransion(const AuthScreen());
      case RouteNames.finishAuthRoute:
        return _smoothTransion(const FinishAuthScreen());
      case RouteNames.homeRoute:
        return _smoothTransion(HomePage(user));
    }
    return null;
  }

  static PageTransition _smoothTransion(Widget child) {
    return PageTransition(child: child, type: PageTransitionType.fade);
  }

  static String getIntialRoute() {
    /* if (HomePageProvider.isFirstTime) {
      return RouteNames.onBoardingRoute;
    } else if (!HomePageProvider.isSignedIn) {
      return RouteNames.authRoute;
    } */
    return RouteNames.authRoute;
  }
}
