import 'package:Fast_Team/server/local/local_session.dart';
import 'package:get/get.dart';


class AbsentController extends GetxController {
  LocalSession localSession = Get.put(LocalSession());
  
  storeCoordinateUser(lat, long) async {
    await localSession.storeCoordinateUser(lat, long);
  }}