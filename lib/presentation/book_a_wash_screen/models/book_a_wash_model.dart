import 'package:get/get.dart';import 'book_a_wash_item_model.dart';/// This class defines the variables used in the [book_a_wash_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class BookAWashModel {Rx<List<BookAWashItemModel>> bookAWashItemList = Rx(List.generate(3,(index) => BookAWashItemModel()));

 }
