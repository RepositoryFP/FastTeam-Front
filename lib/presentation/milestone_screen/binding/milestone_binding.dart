
import 'package:fastteam_app/presentation/milestone_screen/controller/milestone_controller.dart';
import 'package:get/get.dart';

class MilestoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MilestoneController());
  }
}
