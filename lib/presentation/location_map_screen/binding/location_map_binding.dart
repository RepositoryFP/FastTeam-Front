import '../controller/location_map_controller.dart';
import 'package:get/get.dart';

class LocationMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationMapController());
  }
}
