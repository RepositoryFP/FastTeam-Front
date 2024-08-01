import 'package:get/get.dart';import 'recommended_for_item_model.dart';/// This class defines the variables used in the [recommended_for_you_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class RecommendedForYouModel {Rx<List<RecommendedForItemModel>> recommendedForItemList = Rx(List.generate(10,(index) => RecommendedForItemModel()));

 }
