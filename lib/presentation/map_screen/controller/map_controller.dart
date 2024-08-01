import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/network/base_url.dart';
import 'package:fastteam_app/presentation/map_screen/model/map_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MapScreenController extends GetxController {
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

  retriveAccountInformation() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userEmployeeId = prefs.getInt('user-employee_id');

      if (userEmployeeId == null) {
        return {
          "status": 400,
          "details": "Employee ID not found in preferences."
        };
      }

      var result = await retrieveEmployeeInfo(userEmployeeId);
      return Constants().jsonResponse(result);
    } catch (e) {
      return {
        "status": 500,
        "details":
            "Terjadi gangguan ketika mengambil data. Silahkan menghubungi Administrator untuk lebih lanjut."
      };
    }
  }
  retrieveEmployeeInfo(userId) async {
   try {
    var response = await http
        .get(Uri.parse(
            "${BaseServer.serverUrl}/personal-info/$userId/"))
        .timeout(BaseServer.durationlimit);
    return response;
  } catch (e) {
    return {
      "status": 500,
      "details": "Terjadi gangguan ketika mengambil data. Silahkan menghubungi Administrator untuk lebih lanjut."
    };
  }
  }
  storeCoordinateUser(lat, long) async {
    await PrefUtils.storeCoordinateUser(lat, long);
  }
}
