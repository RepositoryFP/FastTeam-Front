import '../controller/recommended_for_you_controller.dart';
import 'package:get/get.dart';

class RecommendedForYouBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecommendedForYouController());
  }
}
