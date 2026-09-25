import 'package:flutter/material.dart';
import 'package:shopee_x/core/resources/padding_manager.dart';
import 'package:shopee_x/core/resources/asset_manager.dart';
import 'package:shopee_x/core/resources/color_manager.dart';
import 'package:shopee_x/core/resources/height_manager.dart';
import 'package:shopee_x/core/resources/route_manager.dart';
import 'package:shopee_x/core/resources/app_navigation.dart';
import 'package:shopee_x/core/resources/font_manager.dart';
import 'package:shopee_x/core/resources/radius_manager.dart';
import 'package:shopee_x/core/resources/utils.dart';
import 'package:shopee_x/view/splash/widget/main_press_button.dart';

class SplachPage extends StatefulWidget {
  const SplachPage({super.key});

  @override
  State<SplachPage> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: PaddingManager.p16),
            child: Column(
              children: [
                SizedBox(height: HeightManager.h100),
                Image.asset(
                  AssetsValuesManager.logo,
                  height: HeightManager.h180,
                ),
                SizedBox(height: HeightManager.h13),
                Image.asset(
                  AssetsValuesManager.nameForLogo,
                  height: HeightManager.h78,
                ),
                SizedBox(height: HeightManager.h20),
                Text(
                  Utils.appTaglineLine1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsManager.grey,
                    fontSize: FontSizeManagers.f16,
                    fontFamily: FontsManagers.roboto,
                  ),
                ),
                SizedBox(height: HeightManager.h23),
                Text(
                  Utils.appTaglineLine2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsManager.grey,
                    fontSize: FontSizeManagers.f16,
                    fontFamily: FontsManagers.roboto,
                  ),
                ),
                SizedBox(height: HeightManager.h73),
                MainPressButton(
                  text: Utils.letsGetStarted,
                  padding: EdgeInsets.zero,
                  backgroundColor: ColorsManager.splashButtonBlack,
                  onTap: () {
                    AppNavigation.pushNamed(context, RouteName.onbourding);
                  },
                ),
                SizedBox(height: HeightManager.h34),
                SizedBox(
                  width: double.infinity,
                  height: HeightManager.h50,
                  child: OutlinedButton(
                    onPressed: () {
                      AppNavigation.pushReplacementNamed(
                        context,
                        RouteName.login,
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: ColorsManager.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          RadiusValuesManager.r15,
                        ),
                      ),
                    ),
                    child: Text(
                      Utils.skip,
                      style: TextStyle(
                        color: ColorsManager.black,
                        fontSize: FontSizeManagers.f16,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontsManagers.roboto,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: HeightManager.h50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Utils.iAlreadyHaveAnAccount,
                      style: TextStyle(
                        color: ColorsManager.grey,
                        fontSize: FontSizeManagers.f14,
                        fontFamily: FontsManagers.roboto,
                      ),
                    ),
                    SizedBox(width: PaddingManager.p10),
                    InkWell(
                      onTap: () {
                        AppNavigation.pushReplacementNamed(
                          context,
                          RouteName.login,
                        );
                      },
                      child: Container(
                        width: HeightManager.h34,
                        height: HeightManager.h34,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorsManager.mainBlue,
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: ColorsManager.white,
                          size: FontSizeManagers.f18,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: HeightManager.h20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
