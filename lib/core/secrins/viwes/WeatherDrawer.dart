// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/constent/Varaibleconstent.dart';
import 'package:newproject/core/controlers/HomControler.dart';
import 'package:newproject/core/secrins/widgets/CoustomorDrawer.dart';
import 'package:newproject/core/themes/ThemeController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class weatherDrawer extends StatelessWidget {
  final Homcontroler C;
  final ThemeController themeController;

  const weatherDrawer({
    super.key,
    required this.C,
    required this.themeController,
  });

  @override
  Widget build(BuildContext context) {
    // جلب TextTheme و ColorScheme من السيم الحالي للتطبيق
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          gradient: themeController.currentGradient.value,
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // رأس القائمة (Drawer Header)
              CoustomorDrawer.buildHeader(textTheme, C),

              // المواقع المفضلة
              // ListTile(
              //   leading: const Icon(Icons.star, color: Colors.amber),
              //   title: Text(
              //     "30".tr, // المواقع المفضلة
              //     style: textTheme.titleMedium,
              //   ),
              //   onTap: () {
              //     Get.back();
              //     // TODO: توجيه المستخدم لشاشة المواقع المفضلة
              //   },
              // ),

              // const Divider(),

              // اللغة (Language)
              ListTile(
                leading: Icon(Icons.language, color: colorScheme.primary),
                title: Text('31'.tr, style: textTheme.titleMedium),
                trailing: Text(
                  Get.locale?.languageCode == 'ar' ? 'العربية' : 'English',
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () async {
                  var prefs = await SharedPreferences.getInstance();
                  //  var lang= prefs.getString(Varaibleconstent.codelangouge) ;
                  //add code langouge to sherdPregrince
                  if (Get.locale?.languageCode == 'ar') {
                    prefs.setString(Varaibleconstent.codelangouge, "en");
                    Get.updateLocale(const Locale('en'));
                  } else {
                    Get.updateLocale(const Locale('ar'));
                    prefs.setString(Varaibleconstent.codelangouge, "ar");
                  }
                },
              ),

              // الوضع الداكن (Dark Mode)
              Obx(
                () => SwitchListTile(
                  // activeThumbColor: colorScheme.primary,
                  // inactiveThumbColor: ,
                  secondary: Icon(
                    Icons.brightness_6,
                    color: themeController.isDarkMode == true
                        ? Colors.orangeAccent
                        : colorScheme.primary,
                  ),
                  title: Text(
                    '38'.tr, // الوضع الداكن
                    style: textTheme.titleMedium,
                  ),
                  value: themeController.isDarkMode == true,
                  onChanged: (value) async {
                    await themeController.toggleTheme();
                  },
                ),
              ),
              // وحدة درجة الحرارة
              ListTile(
                leading: const Icon(Icons.thermostat, color: Colors.redAccent),
                title: Text("37".tr, style: textTheme.titleMedium),
                trailing: Text('°C / °F', style: textTheme.bodyMedium),
                onTap: () {
                  // إضافة دالة لتغيير وحدة درجة الحرارة
                },
              ),
              Divider(),
              // حول التطبيق (About App)
              ListTile(
                leading: const Icon(
                  Icons.info_outline,
                  color: Colors.cyanAccent,
                ),
                title: Text("34".tr, style: textTheme.titleMedium),
                subtitle: Text('v1.0.0', style: textTheme.bodySmall),
                onTap: () {
                  CoustomorDrawer.showAboutDialog(textTheme);
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
