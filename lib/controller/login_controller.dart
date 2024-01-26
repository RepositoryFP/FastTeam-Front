import 'package:Fast_Team/server/network/login_net_utils.dart';
import 'package:Fast_Team/server/network/employee_net_utils.dart';
import 'package:Fast_Team/server/local/local_session.dart';
import 'package:Fast_Team/helpers/response_helper.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginNetUtils loginNetUtils = Get.put(LoginNetUtils());
  EmployeeNetUtils employeeNetUtils = Get.put(EmployeeNetUtils());
  LocalSession localSession = Get.put(LocalSession());

  static var isLogin = "".obs;

  requestLoginUser(email, password) async {
    var result = await loginNetUtils.requestLoginUser(email, password);

    return ResponseHelper().jsonResponse(result);
  }

  retrieveEmployeeInfo(userId) async {
    var result = await employeeNetUtils.retrieveEmployeeInfo(userId);

    return ResponseHelper().jsonResponse(result);
  }

  storeUserInfo(jsonData) async {
    await localSession.storeUserInfo(jsonData);
  }

  storeEmployeeInfo(jsonData) async {
    await localSession.storeEmployeeInfo(jsonData);
  }

  retrieveUserIsLogin() async {
    await localSession.retrieveIsLogin();

    isLogin.value = LocalSession.statusLogin.value;
  }
}
