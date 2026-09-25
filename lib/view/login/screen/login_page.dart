import 'package:flutter/material.dart';

import 'package:shopee_x/core/resources/color_manager.dart';
import 'package:shopee_x/core/resources/height_manager.dart';
import 'package:shopee_x/core/resources/padding_manager.dart';
import '../widget/data_box_in_login_page.dart';
import '../widget/welcome_text_and_logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backGroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: HorizontalPaddingManager.p24,
          vertical: VerticalPaddingManager.p24,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: HeightManager.h20),
                  WelcomeTextAndLogo(),
                  SizedBox(height: HeightManager.h20),
                  DataBoxInLoginPage(formKey: _formKey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
