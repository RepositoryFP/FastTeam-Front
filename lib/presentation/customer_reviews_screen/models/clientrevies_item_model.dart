import 'package:get/get.dart';

/// This class is used in the [clientrevies_item_widget] screen.

class ClientreviesItemModel {
  Rx<String>? id = Rx("");
  String? userImage;
  String? name;
  String? reviewDescription;
  ClientreviesItemModel(this.userImage,this.name,this.reviewDescription);
}
