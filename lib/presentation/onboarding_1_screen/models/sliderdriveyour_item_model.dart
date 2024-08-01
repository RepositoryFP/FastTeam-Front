import 'package:fastteam_app/core/app_export.dart';

import 'onboarding_1_model.dart';

/// This class is used in the [sliderdriveyour_item_widget] screen.

class SliderdriveyourItemModel {
  Rx<String>? id = Rx("");
  static List<Onboarding1Model> getOnboardingData(){
   return [
    Onboarding1Model(ImageConstant.imgOnboarding1st,"Drive your car clean everyday","Meet the nearest available car cleaner to your location"),
    Onboarding1Model(ImageConstant.imgOnboarding2nd,"Find reliable car cleaners","Meet the nearest available car cleaner to your location"),
    Onboarding1Model(ImageConstant.imgOnboarding3rd,"Book your door step car wash","Meet the nearest available car cleaner to your location"),
   ];
  }
}
