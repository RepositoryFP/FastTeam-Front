import 'package:fastteam_app/core/app_export.dart';
import 'package:flutter/material.dart';

class ServiceDetailController extends GetxController {
  TextEditingController packageratioController = TextEditingController();

  // Rx<ServiceDetailModel> serviceDetailModelObj = ServiceDetailModel().obs;
int currentPage = 0;
int currentPackege = 0;
  @override
  void onReady() {
    super.onReady();
  }


  void setCurrentPage(int value) {
    currentPage = value;
    update();
  }

  void setCurrentPackege(int index) {
    currentPackege= index;
    update();
  }
}
