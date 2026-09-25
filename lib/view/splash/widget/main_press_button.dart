import 'package:flutter/material.dart';
import 'package:shopee_x/core/resources/color_manager.dart';
import 'package:shopee_x/core/resources/font_manager.dart';
import 'package:shopee_x/core/resources/height_manager.dart';
import 'package:shopee_x/core/resources/radius_manager.dart';

class MainPressButton extends StatelessWidget {
  const MainPressButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.padding,
    this.backgroundColor,
  });
  final String text;
  final VoidCallback onTap;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: HeightManager.h50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RadiusValuesManager.r15),
            color: backgroundColor,
            gradient: backgroundColor != null
                ? null
                : LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [ColorsManager.primary, ColorsManager.blue600],
                  ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: ColorsManager.white,
              fontSize: FontSizeManagers.f16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
