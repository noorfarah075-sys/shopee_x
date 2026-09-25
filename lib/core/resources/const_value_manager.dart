import 'package:shopee_x/core/resources/asset_manager.dart';
import 'package:shopee_x/core/resources/utils.dart';
import 'package:shopee_x/model/onbourding_page_model.dart';

class ConstValueManager {
  static List<OnbourdingPageModel> listOnbourdingPageModel = [
    OnbourdingPageModel(
      image: AssetsValuesManager.onboarding1,
      title: Utils.titleOnbourding1,
      description: Utils.descriptionOnbourding1,
    ),
    OnbourdingPageModel(
      image: AssetsValuesManager.onboarding2,
      title: Utils.titleOnbourding2,
      description: Utils.descriptionOnbourding2,
    ),
    OnbourdingPageModel(
      image: AssetsValuesManager.onboarding3,
      title: Utils.titleOnbourding3,
      description: Utils.descriptionOnbourding3,
    ),
    OnbourdingPageModel(
      image: AssetsValuesManager.onboarding4,
      title: Utils.titleOnbourding4,
      description: Utils.descriptionOnbourding4,
    ),
    OnbourdingPageModel(
      image: AssetsValuesManager.onboarding5,
      title: Utils.titleOnbourding5,
      description: Utils.descriptionOnbourding5,
    ),
    OnbourdingPageModel(
      image: AssetsValuesManager.onboarding6,
      title: Utils.titleOnbourding6,
      description: Utils.descriptionOnbourding6,
    ),
  ];
}
