import '../controller/our_reviews_success_controller.dart';
import 'package:get/get.dart';

class OurReviewsSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OurReviewsSuccessController());
  }
}
