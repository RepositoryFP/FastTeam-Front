import 'package:get/get.dart';import 'reviews_item_model.dart';/// This class defines the variables used in the [reviews_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ReviewsModel {Rx<List<ReviewsItemModel>> reviewsItemList = Rx(List.generate(2,(index) => ReviewsItemModel()));

 }
