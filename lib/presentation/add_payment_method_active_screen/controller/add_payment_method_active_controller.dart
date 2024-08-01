import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/presentation/add_payment_method_active_screen/models/add_payment_method_active_model.dart';
import 'package:flutter/material.dart';

class AddPaymentMethodActiveController extends GetxController {
  TextEditingController cardnumberoneController = TextEditingController();

  TextEditingController expdateoneController = TextEditingController();

  TextEditingController cvvoneController = TextEditingController();

  Rx<AddPaymentMethodActiveModel> addPaymentMethodActiveModelObj =
      AddPaymentMethodActiveModel().obs;

  @override
  void onReady() {
    super.onReady();
  }


}
