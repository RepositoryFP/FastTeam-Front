import 'dart:convert';

class Constants {

  jsonResponse(result) {
    Map<String, dynamic> out = {};

    if (result.statusCode == 500) {
      out = {
        "status": result.statusCode,
        "details":
            "Terjadi gangguan ketika mengambil data. Silahkan menghubungi Administrator untuk lebih lanjut.",
      };
    } else {
      out = {
        "status": result.statusCode,
        "details":
             jsonDecode(result.body),
      };
    }

    return out;
  }
}

class TimeHelper {

  String formatTime(String time) {
    // Assuming the input time format is "H:i:s"
    final parts = time.split(':');
    if (parts.length >= 2) {
      return '${parts[0]}:${parts[1]}';
    }
    return time; // Return the original value if it couldn't be formatted
  }
}