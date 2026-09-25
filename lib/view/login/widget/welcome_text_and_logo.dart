import 'package:flutter/material.dart';
import 'package:shopee_x/core/resources/asset_manager.dart';
import 'package:shopee_x/core/resources/color_manager.dart';
import 'package:shopee_x/core/resources/font_manager.dart';
import 'package:shopee_x/core/resources/height_manager.dart';
import 'package:shopee_x/core/resources/utils.dart';

class WelcomeTextAndLogo extends StatelessWidget {
  const WelcomeTextAndLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AssetsValuesManager.logo, height: HeightManager.h100),
        SizedBox(height: HeightManager.h20),
        Text(
          Utils.welcomeLogin,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorsManager.white,
            fontSize: FontSizeManagers.f20,
            fontWeight: FontWeight.bold,
            fontFamily: FontsManagers.poppins,
          ),
        ),
      ],
    );
  }
}
