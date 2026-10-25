import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      '1': 'Home',
      '2': 'City',
      '3': 'More',
      '4': 'Profile',
      '5': 'Accurate weather, every moment',
      '6': 'Locating & initializing data...',
      '7': 'wearhe Breeze',
      '8': 'No internet connection. Please check your network and try again',
      '9': 'Notice',
      '10': 'Location permission was not granted',
      '11': "Trey agen ",
      '12': "Erorr",
      "13": "Failed to fetch city ",
      '14': "now",
      "15": " m/s",
      //day
      "16": "Monday",
      "17": "Tuesday",
      "18": "Wednesday",
      "19": "Thursday",
      "20": "Friday",
      "21": "Saturday",
      "22": "Sunday",
      //fan day
      "23": "Would you like to update the weather data now?",
      "24": "Location service is disabled",
      "25": "Location permission was denied",
      "26": "Location permissions are permanently denied",
      "27": "Location request timed out",
      "28": "Location fetched successfully",
      "29": "Success",
      "30": "Favorite location",
      "31": "chainge language",
      "32": "Location Loading Status ...",
      "33": "Location has not been specified yet",
      "34": "About the App",
      "35": "OK",
      "36": "Nassim Weather provides accurate real-time weather updates\n detailed temperature forecasts\n upcoming daily trends, and local climate insights in a simple and fast interface.",
      "37": "Temperature Unit",
      "38": "Dark Mode",
      "39": "Search for a city..."
    },
    'ar': {
      '1': 'الرئيسية',
      '2': 'المدينة',
      '3': 'المزيد',
      '4': 'الملف الشخصي',
      '5': 'توقع الطقس في كل لحظة',
      '6': 'جاري تحديد الموقع وتهيئة البيانات...',
      '7': 'نسيم الطقس ',
      '8': 'لا يوجد اتصال بالإنترنت. يرجى التحقق من الشبكة وإعادة المحاولة',
      '9': 'تنبيه',
      '10': 'لم يتم منح اذن الوصول الى الموقع ',
      "11": "إعادة المحاولة",
      "12": "خطا",
      "13": '"فشل  في جلب المدينة',
      "14": 'الآن',
      "15": " م/ث",
      //day
      "16": "الإثنين",
      "17": "الثلاثاء",
      "18": "الأربعاء",
      "19": "الخميس",
      "20": "الجمعة",
      "21": "السبت",
      "22": "الأحد",
      //fan day
      "23": "هل تريد تحديث بيانات الطقس الآن؟",
      "24": 'خدمة الموقع مغلقة',
      "25": "تم رفض إذن الوصول إلى الموقع",
      "26": "تم رفض إذن الموقع بشكل دائم",
      "27": "انتهت مهلة البحث عن الموقع",
      "28": "تم تحديد الموقع بنجاح",
      "29": "نجاح",
      "30": "'المواقع المفضلة",
      "31": "'تغيير اللغة",
      "32": "جاري تحميل الموقع...",
      "33": "لم يتم تحديد الموقع بعد",
      "34": "حول التطبيق",
      "35": "حسناً",
      "36": "تطبيق نسيم طقس يوفر لك متابعة دقيقة وتحديثات مباشرة لحالة الطقس\n بما في ذلك درجات الحرارة، توقعات الأيام القادمة\nوتفاصيل المناخ في منطقتك بأسلوب بسيط وسريع.",
      "37": 'وحدة الحرارة',
      "38": "الوضع الداكن",
      "39":'ابحث عن مدينة...'
    },
  };
}

class LanguageController extends GetxController {
  Future<void> changeLanguage(String langCode) async {
    Locale? locale;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (langCode == "ar") {
      locale = const Locale("ar");
    } else if (langCode == 'en') {
      locale = const Locale("en");
    } else {
      await prefs.remove('selected_language');
      Get.updateLocale(Get.deviceLocale ?? const Locale('en'));
      return;
    }
    Get.updateLocale(locale);
    await prefs.setString('selected_language', langCode);
  }
}
