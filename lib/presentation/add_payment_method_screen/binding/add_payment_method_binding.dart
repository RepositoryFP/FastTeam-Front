import '../controller/add_payment_method_controller.dart';
import 'package:get/get.dart';

class AddPaymentMethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddPaymentMethodController());
  }
}
