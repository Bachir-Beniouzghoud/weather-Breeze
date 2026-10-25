import 'package:flutter/material.dart';

class AppColors {
  //  Background
  static const Color nightBlue = Color(0xFF062A45);

  static const Color skyBlue = Color(0xFF0B3B5D);

  //  Weather / Accent
  static const Color skyLight = Color(0xFFBFE8F7);
  static const Color cloud = Color(0xFFD9DEE2);

  // Text
  static const Color white = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFFF5F7FA);
  static const Color textSecondary = Color(0xFFB8C4CE);

  // Glass
  static const Color glassWhite = Color(0x66FFFFFF);
  static const Color glassLight = Color(0x40FFFFFF);
  static const Color glassBorder = Color(0x55FFFFFF);

  //  Navigation

  static const Color navigationSelected = Color(0x4DFFFFFF);

  //  Weather accent
  static const Color temperature = Color(0xFFFFFFFF);
  // ألوان الوضع الداكن
  static const Color navigation = Color(0x66999DA5);
  static const Color deepBlue = Color(0xFF031A2C);
  // تدرج الوضع الداكن
  static const LinearGradient darkWeatherGradient = LinearGradient(
    colors: [deepBlue, nightBlue],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // تدرج الوضع الفاتح (سماوي ناعم ومريح)
  static const LinearGradient lightWeatherGradient = LinearGradient(
    colors: [Color(0xFFEBF3FA), Color(0xFFCBD5E1)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  
  static LinearGradient getBackgroundGradient(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? AppColors.darkWeatherGradient
        : AppColors.lightWeatherGradient;
  }
}
