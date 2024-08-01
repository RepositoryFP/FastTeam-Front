
import 'package:fastteam_app/core/app_export.dart';

import 'package:fastteam_app/presentation/map_screen/model/map_model.dart';
import 'package:flutter/material.dart';


class CameraScreenController extends GetxController {
  TextEditingController searchController = TextEditingController();
  

  Rx<MapModel> locationMapModelObj = MapModel().obs;
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
