// colors
import 'package:flutter/material.dart';

class AppColors {
  static const int kPurplePrimaryValue = 0xFFBB86FC;
  static const MaterialColor purple = MaterialColor(
    kPurplePrimaryValue,
    <int, Color>{
      50: Color(0xFFF2E7FE),
      100: Color(0xFFDBB2FF),
      200: Color(kPurplePrimaryValue),
      300: Color(0xFF985EFF),
      400: Color(0xFF7F39FB),
      500: Color(0xFF6200EE),
      600: Color(0xFF5600E8),
      700: Color(0xFF3700B3),
      800: Color(0xFF30009C),
      900: Color(0xFF23036A),
    },
  );
  static const int kCyanPrimaryValue = 0xFF03DAC5;
  static const MaterialColor cyan = MaterialColor(
    kCyanPrimaryValue,
    <int, Color>{
      50: Color(0xFFC8FFF4),
      100: Color(0xFF70EFDE),
      200: Color(kCyanPrimaryValue),
      300: Color(0xFF00C4B4),
      400: Color(0xFF00B3A6),
      500: Color(0xFF01A299),
      600: Color(0xFF019592),
      700: Color(0xFF018786),
      800: Color(0xFF017374),
      900: Color(0xFF005457),
    },
  );

  static const Color background = Color(0xFF121212);
  static const Color surface = Color(0xFF121212);
  static const Color error = Color(0xFFCF6679);
  
}
