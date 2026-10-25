import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:newproject/constent/Varaibleconstent.dart';
import 'package:newproject/core/controlers/HomControler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoustomorDrawer {
  static Widget buildHeader(TextTheme textTheme, Homcontroler Controler) {
    return DrawerHeader(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(Icons.wb_sunny, color: Colors.amber, size: 40),
              SizedBox(width: 12),
              Text('7'.tr, style: textTheme.titleMedium),
            ],
          ),
          const SizedBox(height: 16),
          FutureBuilder<SharedPreferences>(
            future: SharedPreferences.getInstance(),

            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text(
                  '32'.tr, //جاري التحميل ...
                  style: textTheme.titleLarge,
                );
              }
              final prefs = snapshot.data!;
              final locality = prefs.getString(Varaibleconstent.locality) ?? '';
              final country =
                  prefs.getString(Varaibleconstent.administrativeArea) ??
                  '33'.tr; //"لم يتم تحديد الموقع بعد"
              return Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.redAccent,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  InkWell(
                    onTap: () {
                      if (country.isNotEmpty) {
                        Controler.searchWeatherByCity(country);
                        Get.back();
                      }
                    },
                    child: Text(
                      '$locality, $country',
                      style: textTheme.bodyMedium,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  static void showAboutDialog(TextTheme textTheme) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        // backgroundColor: const Color(
        //   0xFF092542,
        // ), // لون الخلفية الداكن الظاهر في الصورة
        title: Center(
          child: Text(
            "34".tr, // "حول التطبيق"
            style: textTheme.titleLarge,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "36".tr, // النص الوصفي للتطبيق
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),

            // زر التأكيد بعرض كامل وبادينغ مناسب
            SizedBox(
              width: double.infinity, // جعل الزر يأخذ العرض المتاح بالكامل
              child: ElevatedButton(
                onPressed: () => Get.back(),
                child: Text(
                  "35".tr, // "حسناً"
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
