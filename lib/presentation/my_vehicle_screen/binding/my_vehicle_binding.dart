import '../controller/my_vehicle_controller.dart';
import 'package:get/get.dart';

class MyVehicleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyVehicleController());
  }
}
