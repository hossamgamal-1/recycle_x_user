import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recyclex/presentation/screens/home_page.dart';

import '../presentation/screens/auth_log_in.dart';
import '../presentation/screens/auth_sign_up.dart';
import '../presentation/screens/finish_auth.dart';

class RouteNames {
  static const String authLogInRoute = '/auth_log_in';
  static const String authSignUpRoute = '/auth_sign_up';
  static const String finishAuthRoute = '/finish_auth';
  static const String homeRoute = '/home';
}

class AppRouter {
  static Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.authLogInRoute:
        return _smoothTransion(const AuthLogInScreen());
      case RouteNames.authSignUpRoute:
        return _smoothTransion(const AuthSignUpScreen());
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
    return false //sL<CachCubit>().isUser()
        ? RouteNames.homeRoute
        : RouteNames.authSignUpRoute;
  }
}
