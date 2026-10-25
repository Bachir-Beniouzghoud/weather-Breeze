// import 'package:flutter/services.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:newproject/constent/Varaibleconstent.dart';
// import 'package:newproject/core/network/internate.dart';
// import 'package:newproject/core/services/permissions.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Splashcontroler extends GetxController {
//   final Internate _isconection = Internate();
//   final Permission _permission = Permission();
//   var isLoading = true.obs;
//   var hasInternetError = false.obs;
//   var errorMessage = ''.obs;
//   @override
//   void onReady() async {
//     await intailApp();
//     // _navigateToHome();
//     super.onReady();
//   }

//   void _navigateToHome() async {
//     await Future.delayed(const Duration(seconds: 1, milliseconds: 50));
//     // Get.offAll(HomeBinding());
//     await Get.offAllNamed(
//       '/home',
//     ); // الانتقال للشاشة الرئيسية واستبدال الـ Splash
//   }

//   Future<void> intailApp() async {
//     isLoading(true);
//     hasInternetError(false);
//     // فحص الاتصال بالشبكة
//     bool hasInternet = await _isconection.checkInternet();

//     if (!hasInternet) {
//       isLoading(false);
//       hasInternetError(true);
//       errorMessage('8'.tr);
//       return;
//     }
//     // التحقق من صلاحية الموقع
//     Position? position = await _permission.getlocation();
//     if (position == null) {
//       isLoading(false);
//       // shwo Massege to User
//       Get.snackbar("9".tr, "10".tr, duration: const Duration(seconds: 3));
//       return;
//     } else {
//       // جلب اسم المدينة
//       var ciyte = await _permission.getCity();
//       final SharedPreferences prefs = await SharedPreferences.getInstance();

//       if (ciyte is Placemark) {
//         bool isSve = await _permission.savePlacemarkToPrefs(ciyte);
//         if (isSve) {
//           prefs.setBool(Varaibleconstent.isSaveLocation, true);
//         }
//       } else if (ciyte is PlatformException) {
//         prefs.setBool(Varaibleconstent.isSaveLocation, false);
//         errorMessage('$ciyte');
//       }
//     }
//     //   //اسندعاء الدالة getCity();

//     return _navigateToHome();
//   }

//   Retry() async {
//     isLoading.value = true;
//     await intailApp();
//   }
// }
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:newproject/constent/AppColors.dart';
import 'package:newproject/constent/Varaibleconstent.dart';
import 'package:newproject/core/network/internate.dart';
import 'package:newproject/core/services/permissions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashcontroler extends GetxController {
  final Internate _isconection = Internate();
  final Permission _permission = Permission();

  var isLoading = true.obs;
  var hasInternetError = false.obs;
  var errorMessage = ''.obs;

  @override
  void onReady() async {
    await intailApp();
    super.onReady();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 500));
    await Get.offAllNamed('/home');
  }

  Future<void> showMassege(Position? position) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isSaved = prefs.getBool(Varaibleconstent.isSaveLocation) ?? false;

    if (isSaved) {
      return;
    } else {
      return await Get.defaultDialog(
        title: "9".tr,
        middleText: "23".tr,
        backgroundColor: AppColors.deepBlue, // يمكنك تخصيص الألوان حسب تطبيقك
        titleStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        middleTextStyle: const TextStyle(color: Colors.white70),
        textConfirm: "موافق",
        textCancel: "إلغاء",
        confirmTextColor: Colors.white,
        buttonColor: Colors.blue,
        onConfirm: () async {
          var cityResult = await _permission.getCity(position!);
          if (cityResult is Placemark) {
            isSaved = await _permission.savePlacemarkToPrefs(cityResult);
            prefs.setBool(Varaibleconstent.isSaveLocation, isSaved!);
            print("**********Save***");
            print(prefs.getBool(Varaibleconstent.isSaveLocation));
          } else {
            prefs.setBool(Varaibleconstent.isSaveLocation, false);
            errorMessage(cityResult.toString());
          }
          Get.back();
        },
        onCancel: () {
          Get.back();
          // الكود عند إلغاء العملية
        },
      );
    }
  }

  Future<void> intailApp() async {
    isLoading(true);
    hasInternetError(false);

    // 1. فحص الاتصال بالشبكة
    bool hasInternet = await _isconection.checkInternet();
    if (!hasInternet) {
      isLoading(false);
      hasInternetError(true);
      errorMessage('8'.tr);
      return ;
    }

    //  التحقق وجلب الموقع
    dynamic position = await _permission.getLocation();
    if (position is String) {
      isLoading(false);
      Get.snackbar("9".tr, position, duration: const Duration(seconds: 3));

      //   الانتقال للصفحة الرئيسية بقيم افتراضية
      return ;
    } else {
      // نجاح / Success", // عنوان الـ Snackbar للحالة الناجحة
      // "تم تحديد الموقع بنجاح / Location fetched successfully
      Get.snackbar("29".tr, "28".tr, duration: const Duration(seconds: 3));
      await showMassege(position);


    }

    //  انشاء دالة عرض رسالة للمستخدم يريد حفظ بينات الموقع ام لا

    //  تمرير الإحداثيات مباشرة لدالة جلب المدينة

    // الانتقال للشاشة الرئيسية
    return _navigateToHome();
  }

  Future<void> retry() async {
    errorMessage.value = '';
    isLoading.value = true;
    await intailApp();
  }
}
