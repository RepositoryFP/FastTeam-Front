import 'package:Fast_Team/server/base_server.dart';
import 'package:http/http.dart' as http;

class EmployeeNetUtils {
  retriveListEmployee() async {
    var path = "${BaseServer.serverUrl}/divisi/";
    var response =
        await http.get(Uri.parse(path)).timeout(BaseServer.durationlimit);
    return response;
  }

  retrieveEmployeeInfo(userId) async {
    var response = await http
        .get(Uri.parse("${BaseServer.serverUrl}/api/pegawai/by-user/$userId/"))
        .timeout(BaseServer.durationlimit);

    return response;
  }
}
