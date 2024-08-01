import 'package:get/get.dart';
import 'inbox_model.dart';

/// This class defines the variables used in the [book_a_wash_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class BookAWashModel {
  Rx<List<InboxModel>> bookAWashItemList =
      Rx(List.generate(3, (index) => InboxModel()));
}
