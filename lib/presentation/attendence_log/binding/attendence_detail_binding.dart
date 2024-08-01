
import 'package:fastteam_app/presentation/attendence_log/controller/attendence_detail_controller.dart';
import 'package:get/get.dart';

class AttendenceDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttendenceDetailController());
  }
}
