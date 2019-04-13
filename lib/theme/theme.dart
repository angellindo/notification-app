import 'package:flutter/material.dart';
import 'package:walletguard/theme/colors.dart';
import 'package:walletguard/util/hex-color.dart';

final ThemeData themeData = buildTheme();

ThemeData buildTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: HexColor(mainBackgroundColor),
    accentColor: Colors.red,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: HexColor(mainForegroundColor)
    ),
  );
}
