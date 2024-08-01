import 'package:fastteam_app/core/app_export.dart';

class PaymentMethodOneController extends GetxController {
  // Rx<PaymentMethodOneModel> paymentMethodOneModelObj =
  //     PaymentMethodOneModel().obs;
int currentPaymentMetho = 1;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setCurrentPaymentMethod(id) {
    currentPaymentMetho = id;
    update();
  }
}
