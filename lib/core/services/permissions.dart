// import 'package:flutter/services.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get_utils/src/extensions/internacionalization.dart';
// import 'package:newproject/constent/Varaibleconstent.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Permission {
//   // جلب احداثيات الموقع ***********************
//   Future<Position?> getlocation() async {
//     bool serviseEnable;
//     LocationPermission permission;
//     // التحقق مما إذا كانت خدمة الموقع مفعلة على الجهاز
//     serviseEnable = await Geolocator.isLocationServiceEnabled();
//     if (!serviseEnable) {
//       // خدمات الموقع غير مفعلة
//       return null;
//     }
//     // التحقق من حالة الصلاحيات الحالية
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       // طلب الإذن إذا تم رفضه مسبقاً
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // تم رفض الإذن مرة أخرى
//         return null;
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       // الصلاحية مرفوضة بشكل دائم (لا يمكن إظهار نافذة الطلب مرة أخرى)
//       return null;
//     }
//     // إذا تم منح الصلاحيات، يتم جلب الموقع الحالي
//     Position position = await Geolocator.getCurrentPosition(
//       locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
//       // ignore: deprecated_member_use
//       timeLimit: const Duration(seconds: 6),

//       // ignore: deprecated_member_use
//       forceAndroidLocationManager: true,
//     );

//     return position;
//   }

//   // جللب المدينة
//   Future<dynamic> getCity() async {
//     try {
//       Position? position = await getlocation();
//       if (position == null) return null;
//       List<Placemark> placemarks = await Geocoding().placemarkFromCoordinates(
//         position.latitude,
//         position.longitude,
//       );
//       if (placemarks.isNotEmpty) {
//         return placemarks[0];
//       }
//     } on PlatformException {
//       return "13".tr;
//     }
//   }

//   // الاحتفاض بمعلومات الموقع *********
//   Future<bool> savePlacemarkToPrefs(Placemark? place) async {
//     if (place == null) return false;
//     try {
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString(Varaibleconstent.country, place.country ?? '');
//       await prefs.setString(
//         Varaibleconstent.administrativeArea,
//         place.administrativeArea ?? '',
//       );
//       await prefs.setString(Varaibleconstent.name, place.name ?? '');
//       await prefs.setString(Varaibleconstent.locality, place.locality ?? '');
//       await prefs.setString(
//         Varaibleconstent.subAdministrativeArea,
//         place.subAdministrativeArea ?? '',
//       );
//       await prefs.setString(
//         Varaibleconstent.subLocality,
//         place.subLocality ?? '',
//       );

//       return true; // تمت العملية بنجاح
//     } catch (e) {
//       return false; // حدث خطأ أثناء الحفظ
//     }
//   }
// }
// import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:newproject/constent/Varaibleconstent.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Permission {
  // جلب إحداثيات الموقع مرة واحدة فقط وبشكل آمن
  Future<dynamic> getLocation() async {
    bool serviceEnable;
    LocationPermission permission;

    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) return "24".tr; //خدمة الموقع مغلقة

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return "25".tr; //تم رفض إذن الوصول إلى الموقع
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return "26".tr; //تم رفض إذن الموقع بشكل دائم
    }

    try {
      // إزالة الإعدادات القديمة وإضافة Timeout لمنع تعليق التطبيق
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 20), // مهلة أقصاها 8 ثوانٍ
        ),
      );
      return position;
    } catch (e) {
      //انتهت مهلة البحث عن الموقع
      return "27".tr; // في حال حدث Timeout أو خطأ في الـ GPS
    }
  }

  // جلب المدينة باستقبال الإحداثيات مباشرة (لتجنب إعادة طلب الـ GPS)
  Future<dynamic> getCity(Position position) async {
    try {
      List<Placemark> placemarks = await Geocoding()
          .placemarkFromCoordinates(position.latitude, position.longitude)
          .timeout(const Duration(seconds: 8)); // مهلة للنت / النظام

      if (placemarks.isNotEmpty) {
        return placemarks[0];
      }
      return null;
    } catch (e) {
      return "13".tr; // إرجاع رسالة خطأ نصية واضحة
    }
  }

  // الاحتفاظ بمعلومات الموقع
  Future<bool> savePlacemarkToPrefs(Placemark? place) async {
    if (place == null) return false;
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(Varaibleconstent.country, place.country ?? '');
      await prefs.setString(
        Varaibleconstent.administrativeArea,
        place.administrativeArea ?? '',
      );
      await prefs.setString(Varaibleconstent.name, place.name ?? '');
      await prefs.setString(Varaibleconstent.locality, place.locality ?? '');
      await prefs.setString(
        Varaibleconstent.subAdministrativeArea,
        place.subAdministrativeArea ?? '',
      );
      await prefs.setString(
        Varaibleconstent.subLocality,
        place.subLocality ?? '',
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
