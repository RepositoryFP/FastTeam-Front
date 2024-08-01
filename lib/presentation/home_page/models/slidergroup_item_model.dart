import 'package:get/get.dart';import 'list_item_model.dart';/// This class is used in the [slidergroup_item_widget] screen.
class SlidergroupItemModel {Rx<List<ListItemModel>> listItemList = Rx(List.generate(2,(index) => ListItemModel()));

Rx<String>? id = Rx("");
String? image;
String? title;
String? discount;
SlidergroupItemModel(this.image,this.title,this.discount);

 }
