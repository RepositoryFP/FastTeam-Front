import '../controller/overtime_controller.dart';
import 'package:get/get.dart';

class OvertimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OvertimeController());
  }
}
