import 'package:get/get.dart';
import 'sliderdriveyour_item_model.dart';

/// This class defines the variables used in the [onboarding_1_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class Onboarding1Model {
  Rx<List<SliderdriveyourItemModel>> sliderdriveyourItemList =
      Rx(List.generate(1, (index) => SliderdriveyourItemModel()));
  String? image;
  String? title;
  String? subtitle;
  Onboarding1Model(this.image,this.title,this.subtitle);
}
