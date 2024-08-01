import '../controller/top_rated_controller.dart';
import 'package:get/get.dart';

class TopRatedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopRatedController());
  }
}
