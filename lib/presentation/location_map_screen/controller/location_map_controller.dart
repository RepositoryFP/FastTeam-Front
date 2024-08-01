import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/presentation/location_map_screen/models/location_map_model.dart';
import 'package:flutter/material.dart';

class LocationMapController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<LocationMapModel> locationMapModelObj = LocationMapModel().obs;
String serchingText = "";
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  void setSerching(String value) {
    serchingText = value;
    update();
  }
}
