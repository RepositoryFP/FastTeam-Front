import '../controller/our_reviews_controller.dart';
import 'package:get/get.dart';

class OurReviewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OurReviewsController());
  }
}
