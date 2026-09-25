import 'package:flutter/material.dart';
import 'package:shopee_x/core/widget/un_known_page.dart';
import 'package:shopee_x/view/login/screen/login_page.dart';
import 'package:shopee_x/view/onbourding/screen/on_bourding_page.dart';
import 'package:shopee_x/view/splash/screen/splach_page.dart';

class RoutesManager {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Widget screen;
    String? name = settings.name;
    if (name == RouteName.splach.routeName) {
      screen = const SplachPage();
    } else if (name == RouteName.onbourding.routeName) {
      screen = const OnBourdingPage();
    } else if (name == RouteName.login.routeName) {
      screen = const LoginPage();
    } else {
      screen = UnknownRouteScreen(route: settings.name ?? "");
    }
    return MaterialPageRoute(builder: (context) => screen, settings: settings);
  }
}

enum RouteName {
  splach("/"),
  onbourding("/onbourding"),
  login("/login");

  final String routeName;

  const RouteName(this.routeName);
}

///////////////////
