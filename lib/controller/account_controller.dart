import 'dart:convert';

import 'package:Fast_Team/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountController extends GetxController{
  Future<DataAccountModel> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonData = prefs.getString('jsonUser');
    var jsonDataEmployee = prefs.getString('jsonEmployeeInfo');
    Map<String, dynamic> jsonUserMap = json.decode(jsonData!);
    Map<String, dynamic> jsonEmployeeMap = json.decode(jsonDataEmployee!);
    
    // Merge the two JSON maps
    Map<String, dynamic> mergedJson = {...jsonUserMap, ...jsonEmployeeMap};
    // print(mergedJson);
    DataAccountModel accountModel = DataAccountModel.fromJson(mergedJson);
    return accountModel;
  }
}