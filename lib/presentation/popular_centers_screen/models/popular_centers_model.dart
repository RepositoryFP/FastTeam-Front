import 'package:get/get.dart';import 'popular_centers_item_model.dart';/// This class defines the variables used in the [popular_centers_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PopularCentersModel {Rx<List<PopularCentersItemModel>> popularCentersItemList = Rx(List.generate(10,(index) => PopularCentersItemModel()));

 }
