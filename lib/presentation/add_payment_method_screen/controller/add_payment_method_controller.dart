import 'package:fastteam_app/core/app_export.dart';import 'package:fastteam_app/presentation/add_payment_method_screen/models/add_payment_method_model.dart';import 'package:flutter/material.dart';class AddPaymentMethodController extends GetxController {TextEditingController cardnumberoneController = TextEditingController();

TextEditingController expdateoneController = TextEditingController();

TextEditingController cvvoneController = TextEditingController();

Rx<AddPaymentMethodModel> addPaymentMethodModelObj = AddPaymentMethodModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); cardnumberoneController.dispose(); expdateoneController.dispose(); cvvoneController.dispose(); } 
 }
