import 'package:flutter/services.dart';

class ColorConstant {
  static Color gray5001 = fromHex('#f8f8f8');

  static Color red700 = fromHex('#d83636');

  static Color red500 = fromHex('#ff3d3d');

  static Color green600 = fromHex('#4aa54a');

  static Color gray50 = fromHex('#fafafa');

  static Color red50 = fromHex('#fff3f3');

  static Color greenA700 = fromHex('#04b155');

  static Color black90066 = fromHex('#66000000');

  static Color yellow500 = fromHex('#f7e632');

  static Color black900 = fromHex('#000000');

  static Color yellow800 = fromHex('#f7a521');

  static Color indigo5001 = fromHex('#e6ebf9');

  static Color gray70019 = fromHex('#19606470');

  static Color gray9000f = fromHex('#0f202020');

  static Color redA700 = fromHex('#fc0a15');

  static Color gray600 = fromHex('#808080');

  static Color gray700 = fromHex('#696969');

  static Color lime600 = fromHex('#a5d631');

  static Color blueGray400 = fromHex('#888888');

  static Color indigo50 = fromHex('#e8ebf6');

  static Color amber700 = fromHex('#e1a200');

  static Color black9000f = fromHex('#0f000000');

  static Color yellow50 = fromHex('#fff8ec');

  static Color gray200 = fromHex('#f0eeee');

  static Color gray300 = fromHex('#e6e6e6');

  static Color black90075 = fromHex('#75000000');

  static Color lightGreen50 = fromHex('#eefcf0');

  static Color gray6001e = fromHex('#1e767680');

  static Color indigo800 = fromHex('#26328f');

  static Color whiteA700 = fromHex('#ffffff');
  
  static Color red = fromHex('#D93636');

  static Color gray8004c = fromHex('#4c3c3c43');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
closeApp() {
  Future.delayed(const Duration(milliseconds: 1000), () {
    SystemNavigator.pop();
  });
}
