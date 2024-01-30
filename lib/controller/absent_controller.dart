import 'package:Fast_Team/server/local/local_session.dart';
import 'package:Fast_Team/server/network/employee_net_utils.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AbsentController extends GetxController {
  LocalSession localSession = Get.put(LocalSession());
  EmployeeNetUtils employeeNetUtils = Get.put(EmployeeNetUtils());

  storeCoordinateUser(lat, long) async {
    await localSession.storeCoordinateUser(lat, long);
  }

  retriveCoordinateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('user-id_user');
    var userInfo = await employeeNetUtils.retrieveEmployeeInfo(userId);
    double? savedLatitude = prefs.getDouble('user-position_lat');
    double? savedLongitude = prefs.getDouble('user-position_long');

    var imgProf = userInfo['details']['img_prof_url'];
    var kantor = userInfo['details']['lokasi_group']['name'];
    var shift = '08.00 -16.00';

    
  
  }
}
