import '../controller/add_payment_method_active_controller.dart';
import 'package:get/get.dart';

class AddPaymentMethodActiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddPaymentMethodActiveController());
  }
}
