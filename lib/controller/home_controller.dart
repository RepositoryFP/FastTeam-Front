import 'package:Fast_Team/helpers/response_helper.dart';
import 'package:Fast_Team/server/local/local_session.dart';
import 'package:Fast_Team/server/network/employee_net_utils.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  LocalSession localSession = Get.put(LocalSession());
   EmployeeNetUtils employeeNetUtils = Get.put(EmployeeNetUtils());

  storeCoordinateUser(lat, long) async {
    await localSession.storeCoordinateUser(lat, long);
  }

  retriveListEmployee() async{
    var result = await employeeNetUtils.retriveListEmployee();
    return ResponseHelper().jsonResponse(result);
  }
}
