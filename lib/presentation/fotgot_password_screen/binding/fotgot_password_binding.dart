import '../controller/fotgot_password_controller.dart';
import 'package:get/get.dart';

class FotgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FotgotPasswordController());
  }
}
