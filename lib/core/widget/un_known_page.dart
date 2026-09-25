import 'package:flutter/material.dart';

class UnknownRouteScreen extends StatelessWidget {
  const UnknownRouteScreen({super.key, required this.route});

  final String route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          textAlign: TextAlign.center,
          "not found this route name $route",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
