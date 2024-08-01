import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/presentation/add_car_details_one_screen/models/add_car_details_one_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';

class AddCarDetailsOneController extends GetxController with CodeAutoFill {
  TextEditingController vehiclenumberController = TextEditingController();

  Rx<TextEditingController> otpController = TextEditingController().obs;

  Rx<AddCarDetailsOneModel> addCarDetailsOneModelObj =
      AddCarDetailsOneModel().obs;
bool addCarOpenInProfile = false;
  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  @override
  void codeUpdated() {
    otpController.value.text = code!;
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }

  @override
  void onReady() {
    super.onReady();
  }


  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    addCarDetailsOneModelObj.value.dropdownItemList.value.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    addCarDetailsOneModelObj.value.dropdownItemList.refresh();
  }

  onSelected1(dynamic value) {
    selectedDropDownValue1 = value as SelectionPopupModel;
    addCarDetailsOneModelObj.value.dropdownItemList1.value.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    addCarDetailsOneModelObj.value.dropdownItemList1.refresh();
  }

  void setAddCarNavigation(bool val) {
    addCarOpenInProfile = val;
    update();
  }
}
