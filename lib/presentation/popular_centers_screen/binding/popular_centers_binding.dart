import '../controller/popular_centers_controller.dart';
import 'package:get/get.dart';

class PopularCentersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PopularCentersController());
  }
}
