import '../controller/reset_password_success_controller.dart';
import 'package:get/get.dart';

class ResetPasswordSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordSuccessController());
  }
}
