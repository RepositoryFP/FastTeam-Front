import 'package:fastteam_app/presentation/map_screen/controller/map_controller.dart';

import 'package:get/get.dart';

class MapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MapScreenController());
  }
}
