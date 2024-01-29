import 'package:Fast_Team/server/network/inbox_net_utils.dart';
import 'package:Fast_Team/helpers/response_helper.dart';
import 'package:get/get.dart';

class InboxController {
  InboxNetUtils inboxNetUtils = Get.put(InboxNetUtils());

  retrieveAttendanceList(userId) async {
    var result = await inboxNetUtils.retrieveAttendanceList(userId);

    return ResponseHelper().jsonResponse(result);
  }

  retrieveOvertimeList(userId) async {
    var result = await inboxNetUtils.retrieveOvertimeList(userId);

    return ResponseHelper().jsonResponse(result);
  }
  
  retrieveLeaveList(userId) async {
    var result = await inboxNetUtils.retrieveLeaveList(userId);

    return ResponseHelper().jsonResponse(result);
  }

}