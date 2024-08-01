import '../controller/payment_method_one_controller.dart';
import 'package:get/get.dart';

class PaymentMethodOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentMethodOneController());
  }
}
