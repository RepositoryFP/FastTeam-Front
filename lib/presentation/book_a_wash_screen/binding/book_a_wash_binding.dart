import '../controller/book_a_wash_controller.dart';
import 'package:get/get.dart';

class BookAWashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookAWashController());
  }
}
