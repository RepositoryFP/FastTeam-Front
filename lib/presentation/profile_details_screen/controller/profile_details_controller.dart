import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/network/base_url.dart';
import 'package:fastteam_app/presentation/profile_details_screen/models/profile_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileDetailsController extends GetxController {
  var accountModel = AccountInformationModel();

   var isLoading = false.obs;
  var isDataLoaded = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  retrieveEmployeeInfo(userId) async {
    try {
      var response = await http
          .get(Uri.parse("${BaseServer.serverUrl}/personal-info/$userId/"))
          .timeout(BaseServer.durationlimit);
      return response;
    } catch (e) {
      return {
        "status": 500,
        "details":
            "Terjadi gangguan ketika mengambil data. Silahkan menghubungi Administrator untuk lebih lanjut."
      };
    }
  }

  void retriveAccountInformation() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userEmployeeId = prefs.getInt('user-employee_id');

      if (userEmployeeId == null) {
         return;
      }
       isLoading.value = true;
      if (isDataLoaded.value) return;
      var result = await retrieveEmployeeInfo(userEmployeeId);
      var response = Constants().jsonResponse(result);
      accountModel = AccountInformationModel.fromJson(response['details']['data']);
    } catch (e) {
      print(e);
       throw Exception('Failed to load branch data');
    }
     finally {
      isLoading.value = false;
    }
  }
}
