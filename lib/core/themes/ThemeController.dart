import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/constent/AppColors.dart';
import 'package:newproject/constent/Varaibleconstent.dart';
import 'package:newproject/core/themes/ThemApp.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Ensure the import path is correct

class ThemeController extends GetxController {
  // Reactive variable to track dark mode state
  final RxBool isDarkMode = Get.isDarkMode.obs;
  late final Rx<LinearGradient> currentGradient;
  // LinearGradient currentGradient
  // new name();
  // جلب التدرج المناسب تلقائياً حسب ثيم GetX الحالي
  @override
  void onInit() {
    super.onInit();
    // تهيئة التدرج بناءً على الوضع الحالي عند فتح التطبيق
    currentGradient = Rx<LinearGradient>(
      Get.isDarkMode
          ? AppColors.darkWeatherGradient
          : AppColors.lightWeatherGradient,
    );
  }

  // bool get isDarkMode => isDarkMode.value;
  Future<void> toggleTheme() async {
    var prefs = await SharedPreferences.getInstance();
    if (isDarkMode.value) {
      prefs.setString(Varaibleconstent.mode, "Light");
      Get.changeTheme(Themapp.weatherLightTheme);
      isDarkMode.value = false;
      currentGradient.value = AppColors.lightWeatherGradient;
    } else {
      Get.changeTheme(Themapp.weatherTheme);
      prefs.setString(Varaibleconstent.mode, "Dark");
      isDarkMode.value = true;
      currentGradient.value = AppColors.darkWeatherGradient;
    }
  }
}
