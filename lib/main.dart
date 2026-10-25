import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/constent/Varaibleconstent.dart';
// import 'package:intl/date_symbol_data_file.dart';
// import 'package:newproject/constent/Varaibleconstent.dart';
// import 'package:newproject/constent/Varaibleconstent.dart';
import 'package:newproject/core/bindings/AppPages.dart';
import 'package:newproject/core/bindings/bindings.dart';
import 'package:newproject/core/localization/Translations.dart';
import 'package:newproject/core/themes/ThemApp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.setBool(Varaibleconstent.isSaveLocation, false);
  String? savedLang = prefs.getString(Varaibleconstent.codelangouge);
  String? mode = prefs.getString(Varaibleconstent.mode);
  await initializeDateFormatting('ar', '');
  runApp(MyApp(savedLang: savedLang, mode: mode));
}

class MyApp extends StatelessWidget {
  final String? savedLang, mode;
  const MyApp({super.key, this.savedLang, this.mode});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/SplashSecrin",
      initialBinding: spalshBinding(),
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      theme: Themapp.weatherLightTheme,
      darkTheme: Themapp.weatherTheme, // Default Dark Theme
      themeMode: (mode != null && mode == 'Dark')
          ? ThemeMode.dark
          : ThemeMode.light,
      // theme: Themapp.weatherTheme,
      locale: savedLang != null ? Locale(savedLang!) : Get.deviceLocale,
      getPages: Apppages.routes,
    );
  }
}
