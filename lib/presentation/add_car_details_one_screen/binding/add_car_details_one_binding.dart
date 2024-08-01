import '../controller/add_car_details_one_controller.dart';
import 'package:get/get.dart';

class AddCarDetailsOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCarDetailsOneController());
  }
}
