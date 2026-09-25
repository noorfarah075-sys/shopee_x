import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../core/resources/font_manager.dart';
import '../core/resources/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: (const Size(393, 852)),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, fontFamily: FontsManagers.cairo),
        onGenerateRoute: RoutesManager.onGenerateRoute,
        initialRoute: RouteName.splash.routeName,
      ),
    );
  }
}
