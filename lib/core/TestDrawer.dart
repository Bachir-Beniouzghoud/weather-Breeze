import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:newproject/constent/Varaibleconstent.dart';

class WeatherDrawer extends StatelessWidget {
  const WeatherDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(
        0xFF0A192F,
      ), // لون خلفية متناسق مع الثيم الداكن للتطبيق
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // 1. رأس القائمة (Drawer Header)
          _buildHeader(),

          // 2. المواقع المفضلة
          ListTile(
            leading: const Icon(Icons.star, color: Colors.amber),
            title: const Text(
              'المواقع المفضلة',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Get.back();
              // TODO: توجيه المستخدم لشاشة المواقع المفضلة
            },
          ),

          const Divider(color: Colors.white24),

          // 3. تغيير اللغة (Language Switcher)
          ListTile(
            leading: const Icon(Icons.language, color: Colors.blueAccent),
            title: const Text(
              'تغيير اللغة',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Text(
              
              Get.locale?.languageCode == 'ar' ? 'العربية' : 'English',
              style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // تبديل اللغة ديناميكياً باستخدام GetX
              if (Get.locale?.languageCode == 'ar') {
                Get.updateLocale(const Locale('en', 'US'));
              } else {
                Get.updateLocale(const Locale('ar', 'AE'));
              }
            },
          ),

          // 4. تغيير الثيم (Theme Mode)
          SwitchListTile(
            secondary: const Icon(
              Icons.brightness_6,
              color: Colors.orangeAccent,
            ),
            title: const Text(
              'الوضع الداكن',
              style: TextStyle(color: Colors.white),
            ),
            value: Get.isDarkMode,
            onChanged: (value) {
              Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
            },
          ),

          // 5. وحدات القياس (Units)
          ListTile(
            leading: const Icon(Icons.thermostat, color: Colors.redAccent),
            title: const Text(
              'وحدة الحرارة',
              style: TextStyle(color: Colors.white),
            ),
            trailing: const Text(
              '°C / °F',
              style: TextStyle(color: Colors.white70),
            ),
            onTap: () {
              // TODO: إضافة منطق تبديل وحدة قياس درجات الحرارة
            },
          ),

          const Divider(color: Colors.white24),

          // 6. حول التطبيق (About App)
          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.cyanAccent),
            title: const Text(
              'حول التطبيق',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              'v1.0.0',
              style: TextStyle(color: Colors.white54),
            ),
            onTap: () {
              Get.back();
              _showAboutDialog();
            },
          ),
        ],
      ),
    );
  }

  // تصميم رأس القائمة مع جلب المدينة المحفوظة محلياً
  Widget _buildHeader() {
    return DrawerHeader(
      decoration: const BoxDecoration(color: Color(0xFF020C1B)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            children: [
              Icon(Icons.wb_sunny, color: Colors.amber, size: 34),
              SizedBox(width: 12),
              Text(
                'نسيم طقس',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          FutureBuilder<SharedPreferences>(
            future: SharedPreferences.getInstance(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Text(
                  'جاري تحميل الموقع...',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                );
              }
              final prefs = snapshot.data!;
              final locality =
                  prefs.getString(Varaibleconstent.locality) ?? 'الأغواط';
              final country =
                  prefs.getString(Varaibleconstent.country) ?? 'الجزائر';

              return Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.redAccent,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '$locality, $country',
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // نافذة منبثقة لمعلومات التطبيق باستخدام Get.defaultDialog
  void _showAboutDialog() {
    Get.defaultDialog(
      title: "حول التطبيق",
      middleText: "تطبيق نسيم طقس (Nassim Weather)\n\nتطبيق تعليمي متطور مصمم بلغة Flutter باستخدام هيكلية MVC وإدارة الحالة عبر GetX لاستعراض حالة الطقس بدقة.\n\nتطوير: Bachir",
      textConfirm: "حسناً",
      confirmTextColor: Colors.white,
      buttonColor: Colors.blueAccent,
      onConfirm: () => Get.back(),
    );
  }
}
