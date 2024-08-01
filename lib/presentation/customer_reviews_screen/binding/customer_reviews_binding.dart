import '../controller/customer_reviews_controller.dart';
import 'package:get/get.dart';

class CustomerReviewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerReviewsController());
  }
}
