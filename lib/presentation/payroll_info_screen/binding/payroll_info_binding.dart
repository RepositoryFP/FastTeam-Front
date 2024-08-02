import '../controller/payroll_info_controller.dart';
import 'package:get/get.dart';

class PayrollInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PayrollInfoController());
  }
}
