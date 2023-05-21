import 'package:flutter/material.dart';

class AppColors{
  static Color get primary => const Color(0xFF00BBD7);
  static Map<Brightness, Color> get appBarGray => {
    Brightness.light: const Color(0xFFF4F4F4).withOpacity(.3),
    Brightness.dark: const Color(0xFF18181A).withOpacity(.7),
  };
  static Map<Brightness, Color> get appBarDividerGray => {
    Brightness.light: Colors.black.withOpacity(.3),
    Brightness.dark: Colors.white.withOpacity(.15),
  };
  static Color get gray => const Color(0xFF757575);
  static Map<Brightness, Color> get cardGray => {
    Brightness.light: const Color(0xFFFAFAFA),
    Brightness.dark: const Color(0xFF1C1C1E),
  };
  static Map<Brightness, Color> get dividerGray => {
    Brightness.light: const Color(0xFF3C3C43).withOpacity(.36),
    Brightness.dark: const Color(0xFF545458).withOpacity(.65),
  };
  static Map<Brightness, Color> get iconGray => {
    Brightness.light: const Color(0xFF3C3C43).withOpacity(.30),
    Brightness.dark: const Color(0xFFEBEBF5).withOpacity(.30),
  };
  static Map<Brightness, Color> get listSubtitle => {
    Brightness.light: const Color(0xFF828282).withOpacity(.85),
    Brightness.dark: Colors.white.withOpacity(.55),
  };
  static Color get black => const Color(0xFF0D0D0D);
}
