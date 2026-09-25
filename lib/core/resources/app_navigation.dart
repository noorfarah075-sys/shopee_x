import 'package:flutter/cupertino.dart';
import 'package:shopee_x/core/resources/route_manager.dart';

class AppNavigation {
  AppNavigation._();

  static Future<Object?> pushReplacementNamed(
    BuildContext context,
    RouteName route, {
    Object? args,
  }) async {
    return await Navigator.pushReplacementNamed(
      context,
      route.routeName,
      arguments: args,
    );
  }

  static Future<Object?> pushNamed(
    BuildContext context,
    RouteName route, {
    Object? args,
  }) async {
    return await Navigator.pushNamed(context, route.routeName, arguments: args);
  }

  static Future<Object?> pushAndRemoveUntil(
    BuildContext context,
    RouteName route, {
    Object? args,
  }) async {
    return await Navigator.pushNamedAndRemoveUntil(
      context,
      route.routeName,
      (route) => false,
      arguments: args,
    );
  }
}
