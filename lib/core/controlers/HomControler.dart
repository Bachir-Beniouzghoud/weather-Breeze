import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newproject/core/error/hndleErorr.dart';
import 'package:newproject/core/modles/CurrentForecastData.dart';
import 'package:newproject/core/modles/CurrentWeatherData.dart';
import 'package:newproject/core/modles/forecastItem.dart';
import 'package:newproject/core/services/WeatherServices.dart';
import 'package:newproject/core/services/permissions.dart';

class Homcontroler extends GetxController {
  Rx<CurrentWeatherData> currentWeatherData = (CurrentWeatherData()).obs;
  Rx<Currentforecastdata> currentforecastdata = (Currentforecastdata()).obs;
  Weatherservices weatherservices = Weatherservices();
  String currentLangCode = Get.locale?.languageCode ?? 'en';
  RxInt cnt = 16.obs;
  RxBool isloding = true.obs;

  RxString errorMessage = ''.obs;
  final Permission _permission = Permission();

  @override
  void onReady() {
    super.onReady();
    _handleLocationAndWeather();
  }

  // دالة البحث عن الطقس باستخدام اسم المدينة
  Future<void> searchWeatherByCity(String cityName) async {
    if (cityName.trim().isEmpty) return;
    try {
      isloding(true);
      errorMessage.value = ''; // تصفير الأخطاء السابقة
      // تحويل اسم المدينة إلى إحداثيات (lat, lon)
      List<Location> locations = await Geocoding().locationFromAddress(
        cityName.trim(),
      );
      if (locations.isNotEmpty) {
        double lat = locations.first.latitude;
        double lon = locations.first.longitude;

        // جلب بيانات الطقس الحالي والتوقعات باستخدام الإحداثيات المكتشفة
        await getWeathertData(lat, lon);
        await getforecastData(100, lat, lon);
      } else {
        errorMessage.value =
            "13".tr; // "المدينة غير موجودة" أو رسالة عدم العثور
      }
    } catch (e) {
      errorMessage.value = "13".tr; // التعامل مع استثناء عدم العثور على العنوان
    } finally {
      isloding(false);
    }
    update();
  }

  String getIconUrl(String? iconCode) {
    return "https://openweathermap.org/img/wn/$iconCode@2x.png";
  }

  String formatWeatherDate(int timestamp) {
    // تحويل Timestamp إلى DateTime
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000)
        .toLocal();
    // تهيئة تنسيق التاريخ للغة العربية
    DateFormat formatter = DateFormat('EEEE، d MMMM HH:mm', 'ar');

    return formatter.format(date);
  }

  void retry() {
    errorMessage('');
    _handleLocationAndWeather();
  }

  // **************************دالة خاصة بالمنطق غير المتزامن
  Future<void> _handleLocationAndWeather() async {
    Position? position = await _permission.getLocation();
    dynamic locality = await _permission.getCity(position!);
    if (locality is Placemark) {
      locality = locality.locality.toString();
    }
    if (locality != null && locality.isNotEmpty) {
      // _permission.savePlacemarkToPrefs();
      // استخدام Geocoding لتحويل الاسم لإحداثيات
      List<Location> locations = await Geocoding().locationFromAddress(
        locality,
      );
      if (locations.isNotEmpty) {
        double lat = locations.first.latitude;
        double lon = locations.first.longitude;

        await getWeathertData(lat, lon);
        await getforecastData(100, lat, lon);
      }
    } else {
      errorMessage("13".tr);
    }
  }

  List<forecastItem> removeReplit(List<forecastItem> uniqueForecastList) {
    final A = <forecastItem>[];
    final seenDates = <String>{};
    for (int value = 0; value < uniqueForecastList.length; value++) {
      String dateOnly = uniqueForecastList[value].dtTxt!.split(' ')[0];
      if (!seenDates.contains(dateOnly)) {
        seenDates.add(dateOnly);
        A.add(uniqueForecastList[value]);
      }
    }
    return A;
  }

  // ********************** جلب بينت من الموقع او من التخزين المحلي غير ذالك اعطاء قيمة افتراضية او عدم استدعاء الدالة
  Future<void> getforecastData(
    int cnt,
    double lat,
    double lon, {
    String? city,
  }) async {
    isloding.value = true;
    final respons = await weatherservices.fetchForecastData(
      lat,
      lon,
      cnt: cnt,
      lang: currentLangCode,

      city: city,
    );
    if (respons is ApiFailure) {
      errorMessage(respons.message.toString());
      //Snakbar
      // ******show Massege in api
      Get.snackbar(
        "12".tr,
        errorMessage.value,
        backgroundColor: Colors.red.withValues(alpha: 0.5),
      );
    } else if (respons is Currentforecastdata) {
      // ***************Show Data
      Get.snackbar("تم جلب البينات بنجاح ", errorMessage.value);
      currentforecastdata.value = respons;
    }
    isloding.value = false;
  }

  // جلب بينت من الموقع او من التخزين المحلي غير ذالك اعطاء قيمة افتراضية او عدم استدعاء الدالة
  Future<dynamic> getWeathertData(
    double lat,
    double lon, {
    String? city,
  }) async {
    // RxString errormasseg = ''.obs;
    isloding.value = true;
    // ignore: non_constant_identifier_names
    final Respons = await weatherservices.fetchCurrentWther(
      lat,
      lon,
      lang: currentLangCode,
      city: city,
    );
    if (Respons is ApiFailure) {
      errorMessage(Respons.message.toString());
      //Snakbar
      Get.snackbar(
        "12".tr,
        errorMessage.value,
        backgroundColor: Colors.red.withValues(alpha: 0.5),
      );
    } else if (Respons is CurrentWeatherData) {
      currentWeatherData.value = Respons;
      return Respons;
    }
    isloding.value = false;
  }
}
