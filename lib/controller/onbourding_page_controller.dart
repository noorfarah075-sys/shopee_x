import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shopee_x/core/resources/app_navigation.dart';
import 'package:shopee_x/core/resources/const_value_manager.dart';
import 'package:shopee_x/core/resources/route_manager.dart';
import 'package:shopee_x/model/onbourding_page_model.dart';

class OnbourdingPagesController {
  final BuildContext context;
  late StreamController<int> _streamControllerNextPage;
  late Sink<int> sinkNextPage;
  late Stream<int> streamNextPage;
  late OnbourdingPageModel onbourdingPageModel;
  int index = 0;

  OnbourdingPagesController({required this.context}) {
    onbourdingPageModel = ConstValueManager.listOnbourdingPageModel[index];
  }

  void nextPage() {
    if (index < ConstValueManager.listOnbourdingPageModel.length - 1) {
      index++;
      sinkNextPage.add(index);
      onbourdingPageModel = ConstValueManager.listOnbourdingPageModel[index];
    } else {
      AppNavigation.pushAndRemoveUntil(context, RouteName.login);
    }
  }

  void skipPage() {
    AppNavigation.pushAndRemoveUntil(context, RouteName.login);
  }

  void initStream() {
    _streamControllerNextPage = StreamController<int>.broadcast();
    sinkNextPage = _streamControllerNextPage.sink;
    streamNextPage = _streamControllerNextPage.stream;
  }

  void disposeStream() {
    _streamControllerNextPage.close();
    sinkNextPage.close();
  }
}
