import 'package:get/get.dart';import 'filter_result_item_model.dart';/// This class defines the variables used in the [filter_result_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FilterResultModel {Rx<List<FilterResultItemModel>> filterResultItemList = Rx(List.generate(8,(index) => FilterResultItemModel()));

 }
