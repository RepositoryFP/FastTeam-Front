import '../controller/location_with_select_controller.dart';
import 'package:get/get.dart';

class LocationWithSelectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationWithSelectController());
  }
}
