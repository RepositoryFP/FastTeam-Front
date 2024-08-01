/// This class defines the variables used in the [payment_method_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PaymentMethodOneModel {

  /*
    payment_option(ImageConstant.imgMasterCArdIcon, "**** **** **** 7861".tr, 1),
                            payment_option(ImageConstant.imgPaypalIcon, "Paypal", 2),
                            payment_option(ImageConstant.imgApplePayIcon, "Apple pay", 3),
                            payment_option(ImageConstant.imgGooglePay, "Google pay", 4),
   */
  String? icon;
  String? title;
  int? id;
  PaymentMethodOneModel(this.icon,this.title,this.id);
}
