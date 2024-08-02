import 'dart:convert';

import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/network/base_url.dart';
import 'package:fastteam_app/presentation/inbox_screen/models/inbox_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InboxController extends GetxController {
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

  Future<http.Response> retrieveNotificationList(
      int userId, String token) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http
        .get(Uri.parse("${BaseServer.serverUrl}/notification/$userId/"),
            headers: headers)
        .timeout(BaseServer.durationlimit);
    return response;
  }

  getNotificationList() async {
    try {
      isLoading.value = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var userId = prefs.getInt('user-id_user');

      if (token != null && userId != null) {
        var result = await retrieveNotificationList(userId, token);
        var response = Constants().jsonResponse(result);

        var notificationsList = (response['details'] as List)
            .map((data) => NotificationModel.fromJson(data))
            .toList();
        notifications.assignAll(notificationsList);
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  NotificationModel? getNotificationById(int id) {
    try {
      return notifications.firstWhere((notification) => notification.id == id);
    } catch (e) {
      print('Notification with id $id not found');
      return null; // Return null if not found
    }
  }

  void displayNotification(int id) {
    NotificationModel? notification = getNotificationById(id);
    notificationDetail.clear();
    if (notification != null) {
      notificationDetail.add(notification);
      print('Found notification: ${notificationDetail}');
    } else {
      print('No notification found');
    }
  }

  
}
