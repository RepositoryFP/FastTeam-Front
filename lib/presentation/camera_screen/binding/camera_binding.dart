import 'package:fastteam_app/presentation/camera_screen/controller/camera_controller.dart';

import 'package:get/get.dart';

class CameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CameraScreenController());
  }
}
