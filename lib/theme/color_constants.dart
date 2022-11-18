import 'package:flutter/material.dart';

class ColorConstants {
  static Color textColorPrimary = const Color(0xFF030A1D);
  static Color black = const Color(0xFF000000);
  static Color white = const Color(0xFFFFFFFF);
  static Color grey = const Color(0xFFF4F4F4);
  static Color buttonShadowColor = const Color(0xFF25E098);
  static Color shadowColor = const Color(0xFFE9E9E9);
  static Color redErrorColor = const Color(0xFFFF4D4D);
  static Color grey1 = const Color(0xFFE0E0E0);
  static Color lightScaffoldBackgroundColor = const Color(0xFFEBF2FB);
  static Color primary = const Color(0xFF34A853);
  static Color blue = const Color(0xFF1E5DFF);

  static Color lightGreen = const Color(0xFFE3FFF0);
  static Color lightPurple = const Color(0xFFEBE3FF);
  static Color lightOrange = const Color.fromARGB(255, 199, 51, 51);
  static Color notificationBgColor = const Color(0xFFFFE8D3);
  static Color pink = const Color(0xFFFF6CDF);
}

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

// Color fromHex(String hex) {
//   assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
//       'hex color must be #rrggbb or #rrggbbaa');

//   return Color(
//     int.parse(hex.substring(1), radix: 16) +
//         (hex.length == 7 ? 0xff000000 : 0x00000000),
//   );
// }
