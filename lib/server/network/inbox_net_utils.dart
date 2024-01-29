import 'package:Fast_Team/server/base_server.dart';
import 'package:http/http.dart' as http;

class InboxNetUtils {

  retrieveAttendanceList(userId) async {
    var response = await http
        .get(Uri.parse("${BaseServer.serverUrl}/api/pengajuan-absensi/list/$userId/"))
        .timeout(BaseServer.durationlimit);

    return response;
  }

  retrieveOvertimeList(userId) async {
    var response = await http
        .get(Uri.parse("${BaseServer.serverUrl}/api/lembur/list/$userId/"))
        .timeout(BaseServer.durationlimit);

    return response;
  }
  
  retrieveLeaveList(userId) async {
    var response = await http
        .get(Uri.parse("${BaseServer.serverUrl}/api/izin/list/$userId/"))
        .timeout(BaseServer.durationlimit);

    return response;
  }
}