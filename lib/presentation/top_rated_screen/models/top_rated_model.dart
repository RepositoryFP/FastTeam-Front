import 'package:get/get.dart';import 'top_rated_item_model.dart';/// This class defines the variables used in the [top_rated_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class TopRatedModel {Rx<List<TopRatedItemModel>> topRatedItemList = Rx(List.generate(10,(index) => TopRatedItemModel()));

 }
