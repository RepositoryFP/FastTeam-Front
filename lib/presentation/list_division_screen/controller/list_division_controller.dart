import 'dart:convert';

import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/network/base_url.dart';
import 'package:fastteam_app/presentation/inbox_screen/models/inbox_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ListDivisionController extends GetxController {
  String serchingText = "";

  var notifications = <NotificationModel>[].obs;
  var notificationDetail = <NotificationModel>[].obs;
  var isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setSerching(String value) {
    serchingText = value;
    update();
  }

  void getDataDivision(date, idDivisi){
    
  }
}
