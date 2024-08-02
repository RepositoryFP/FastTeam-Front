import '../controller/attendence_controller.dart';
import 'package:get/get.dart';

class AttendenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttendenceController());
  }
}
