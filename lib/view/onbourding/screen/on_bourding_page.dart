import 'package:flutter/material.dart';
import 'package:shopee_x/core/resources/app_navigation.dart';
import 'package:shopee_x/core/resources/padding_manager.dart';
import 'package:shopee_x/core/resources/radius_manager.dart';
import 'package:shopee_x/view/splash/widget/main_press_button.dart';
import 'package:shopee_x/controller/onbourding_page_controller.dart';
import 'package:shopee_x/core/resources/color_manager.dart';
import 'package:shopee_x/core/resources/const_value_manager.dart';
import 'package:shopee_x/core/resources/font_manager.dart';
import 'package:shopee_x/core/resources/height_manager.dart';
import 'package:shopee_x/core/resources/route_manager.dart';
import 'package:shopee_x/core/resources/utils.dart';

class OnBourdingPage extends StatefulWidget {
  const OnBourdingPage({super.key});

  @override
  State<OnBourdingPage> createState() => _OnbourdingState();
}

class _OnbourdingState extends State<OnBourdingPage> {
  late OnbourdingPagesController _controller;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _controller = OnbourdingPagesController(context: context);
    _pageController = PageController();
    _controller.initStream();
  }

  @override
  void dispose() {
    _controller.disposeStream();
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    _controller.index = index;
    _controller.sinkNextPage.add(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: PaddingManager.p20,
            vertical: PaddingManager.p20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MainPressButton(
                text: Utils.next,
                padding: EdgeInsets.zero,
                backgroundColor: ColorsManager.splashButtonBlack,
                onTap: () {
                  if (_controller.index <
                      ConstValueManager.listOnbourdingPageModel.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    AppNavigation.pushAndRemoveUntil(context, RouteName.login);
                  }
                },
              ),
              SizedBox(height: HeightManager.h16),
              SizedBox(
                width: double.infinity,
                height: HeightManager.h50,
                child: OutlinedButton(
                  onPressed: () {
                    _controller.skipPage();
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
            ],
          ),
        ),
      ),
      body: StreamBuilder(
        stream: _controller.streamNextPage,
        initialData: _controller.index,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return PageView.builder(
            controller: _pageController,
            itemCount: ConstValueManager.listOnbourdingPageModel.length,
            onPageChanged: _onPageChanged,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int pageIndex) {
              final pageModel =
                  ConstValueManager.listOnbourdingPageModel[pageIndex];

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: HeightManager.h55),
                    SizedBox(
                      width: double.infinity,
                      height: HeightManager.h350,
                      child: Image.asset(pageModel.image, fit: BoxFit.contain),
                    ),
                    SizedBox(height: HeightManager.h50),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: HorizontalPaddingManager.p20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            pageModel.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: FontSizeManagers.f32,
                              fontWeight: FontWeight.bold,
                              color: ColorsManager.black,
                              fontFamily: FontsManagers.poppins,
                            ),
                          ),
                          SizedBox(height: HeightManager.h49),
                          Text(
                            textAlign: TextAlign.center,
                            pageModel.description,
                            style: TextStyle(
                              fontSize: FontSizeManagers.f16,
                              color: ColorsManager.grey,
                              fontFamily: FontsManagers.roboto,
                            ),
                          ),
                          SizedBox(height: HeightManager.h24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              ConstValueManager.listOnbourdingPageModel.length,
                              (dotIndex) {
                                final bool isActive = dotIndex == snapshot.data;
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  margin: EdgeInsets.symmetric(
                                    horizontal: PaddingManager.p5,
                                  ),
                                  width: isActive
                                      ? HeightManager.h12
                                      : HeightManager.h8,
                                  height: isActive
                                      ? HeightManager.h12
                                      : HeightManager.h8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isActive
                                        ? ColorsManager.splashButtonBlack
                                        : ColorsManager.blue200,
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: HeightManager.h20),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
