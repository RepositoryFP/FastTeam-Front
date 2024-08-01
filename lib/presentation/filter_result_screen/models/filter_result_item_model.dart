import 'package:get/get.dart';

/// This class is used in the [filter_result_item_widget] screen.

class FilterResultItemModel {
  Rx<String> nameTxt = Rx("Ace Car Wash");

  Rx<String> distanceTxt = Rx("3.7 mi away");

  Rx<String>? id = Rx("");
}
