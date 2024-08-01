import 'package:fastteam_app/presentation/attendence_log/controller/attendence_log_controller.dart';
import 'package:get/get.dart';

class AttendenceLogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttendenceLogController());
  }
}
