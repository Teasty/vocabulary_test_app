import 'package:flutter/material.dart';

class ColorsExt {
  static Color mainText = HexColor.fromHex('#402516');
  static Color secondaryText = HexColor.fromHex('#734A32');
  static Color mainBright = HexColor.fromHex('#F2D8C2');
  static Color mainLight = HexColor.fromHex('#8C6542');
  static Color mainPositive = HexColor.fromHex('#93BFBB');
  static Color mainBg = HexColor.fromHex('#F2EFE9');
}

class HexColor {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
