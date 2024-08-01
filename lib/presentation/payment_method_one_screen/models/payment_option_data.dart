import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/presentation/payment_method_one_screen/models/payment_method_one_model.dart';

class PaymentData{
  static List<PaymentMethodOneModel> getPaymentData(){
    return [
      PaymentMethodOneModel(ImageConstant.imgMasterCArdIcon, "**** **** **** 7861".tr, 1),
      PaymentMethodOneModel(ImageConstant.imgPaypalIcon, "Paypal", 2),
      PaymentMethodOneModel(ImageConstant.imgApplePayIcon, "Apple pay", 3),
      PaymentMethodOneModel(ImageConstant.imgGooglePay, "Google pay", 4),
    ];
  }
}