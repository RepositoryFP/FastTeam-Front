import '../controller/location_with_select_one_controller.dart';
import 'package:get/get.dart';

class LocationWithSelectOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationWithSelectOneController());
  }
}
