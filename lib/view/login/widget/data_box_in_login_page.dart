import 'package:flutter/material.dart';
import 'package:shopee_x/core/resources/color_manager.dart';
import 'package:shopee_x/core/resources/font_manager.dart';
import 'package:shopee_x/core/resources/height_manager.dart';
import 'package:shopee_x/core/resources/padding_manager.dart';
import 'package:shopee_x/core/resources/radius_manager.dart';
import 'package:shopee_x/core/resources/utils.dart';
import 'package:shopee_x/view/splash/widget/main_press_button.dart';

class DataBoxInLoginPage extends StatefulWidget {
  const DataBoxInLoginPage({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  State<DataBoxInLoginPage> createState() => _DataBoxInLoginPageState();
}

class _DataBoxInLoginPageState extends State<DataBoxInLoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  InputDecoration _fieldDecoration(String hint, {Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: ColorsManager.white24,
        fontFamily: FontsManagers.roboto,
      ),
      filled: true,
      fillColor: ColorsManager.white12,
      suffixIcon: suffixIcon,
      contentPadding: EdgeInsets.symmetric(
        horizontal: PaddingManager.p16,
        vertical: PaddingManager.p14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget _fieldLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        color: ColorsManager.white,
        fontSize: FontSizeManagers.f14,
        fontFamily: FontsManagers.roboto,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _fieldLabel(Utils.email),
        SizedBox(height: HeightManager.h8),
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: ColorsManager.white),
          decoration: _fieldDecoration(Utils.enterYourEmail),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return Utils.pleaseEnterYourEmail;
            }
            if (!value.contains('@')) {
              return Utils.enterValidEmail;
            }
            return null;
          },
        ),
        SizedBox(height: HeightManager.h20),
        _fieldLabel(Utils.password),
        SizedBox(height: HeightManager.h8),
        TextFormField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          style: TextStyle(color: ColorsManager.white),
          decoration: _fieldDecoration(
            Utils.enterYourPassword,
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: ColorsManager.white70,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return Utils.pleaseEnterYourPassword;
            }
            if (value.length < 6) {
              return Utils.enterValidPassword;
            }
            return null;
          },
        ),
        SizedBox(height: HeightManager.h10),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            Utils.forgetPassword,
            style: TextStyle(
              color: ColorsManager.mainBlue,
              fontSize: FontSizeManagers.f13,
              fontFamily: FontsManagers.roboto,
            ),
          ),
        ),
        SizedBox(height: HeightManager.h24),
        MainPressButton(
          text: Utils.login,
          padding: EdgeInsets.zero,
          onTap: () {
            if (widget.formKey.currentState!.validate()) {
              // TODO: نداء منطق تسجيل الدخول الفعلي هنا
            }
          },
        ),
        SizedBox(height: HeightManager.h20),
        Row(
          children: [
            Expanded(child: Divider(color: ColorsManager.white24)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: PaddingManager.p10),
              child: Text(
                Utils.or,
                style: TextStyle(
                  color: ColorsManager.white70,
                  fontSize: FontSizeManagers.f13,
                ),
              ),
            ),
            Expanded(child: Divider(color: ColorsManager.white24)),
          ],
        ),
        SizedBox(height: HeightManager.h20),
        OutlinedButton(
          onPressed: () {
            // TODO: نداء منطق الدخول كضيف هنا
          },
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: ColorsManager.white24),
            padding: EdgeInsets.symmetric(vertical: PaddingManager.p14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(RadiusValuesManager.r15),
            ),
          ),
          child: Text(
            Utils.asGuest,
            style: TextStyle(
              color: ColorsManager.white,
              fontSize: FontSizeManagers.f16,
              fontWeight: FontWeight.bold,
              fontFamily: FontsManagers.roboto,
            ),
          ),
        ),
        SizedBox(height: HeightManager.h20),
        Center(
          child: RichText(
            text: TextSpan(
              text: "${Utils.donNotHaveAccount} ",
              style: TextStyle(
                color: ColorsManager.white70,
                fontSize: FontSizeManagers.f13,
                fontFamily: FontsManagers.roboto,
              ),
              children: [
                TextSpan(
                  text: Utils.signUp,
                  style: TextStyle(
                    color: ColorsManager.mainBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
