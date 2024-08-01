import 'package:fastteam_app/presentation/payslip_screen/controller/payslip_controller.dart';
import 'package:get/get.dart';

class PayslipBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PayslipController());
  }
}
