import 'package:flutter/material.dart';
import 'package:shopee_x/core/widget/un_known_page.dart';
import 'package:shopee_x/view/login/screen/login_screen.dart';
import 'package:shopee_x/view/onbourding/screen/on_bourding_screen.dart';
import 'package:shopee_x/view/splash/screen/splash_screen.dart';

class RoutesManager {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Widget screen;
    String? name = settings.name;
    if (name == RouteName.splash.routeName) {
      screen = const SplashScreen();
    } else if (name == RouteName.onbourding.routeName) {
      screen = const OnBourdingScreen();
    } else if (name == RouteName.login.routeName) {
      screen = const LoginScreen();
    } else {
      screen = UnknownRouteScreen(route: settings.name ?? "");
    }
    return MaterialPageRoute(builder: (context) => screen, settings: settings);
  }
}

enum RouteName {
  splash("/"),
  onbourding("/onbourding"),
  login("/login");

  final String routeName;

  const RouteName(this.routeName);
}

///////////////////
