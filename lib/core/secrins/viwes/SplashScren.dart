import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/constent/AppColors.dart';
import 'package:newproject/core/controlers/SplashControler.dart';
import 'package:newproject/core/secrins/widgets/coustomorSplashSecrin.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final Splashcontroler controler = Get.find();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.deepBlue, AppColors.nightBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            //  أيقونة الشعار مع تأثير ظل ملون
            Coustomorsplashsecrin.IconContainer(),
            // space
            SizedBox(height: h * 0.008),
            // . اسم التطبيق
            Coustomorsplashsecrin.nameApp(),
            SizedBox(height: h * 0.00794),
            // Text bodey  ="'توقع الطقس في كل لحظة"
            Text("5".tr, style: TextStyle(fontSize: 14, color: Colors.white54)),
            // ElevatedButton(onPressed: con, child: child)
            const Spacer(),
            Obx(() {
              if (controler.isLoading.value) {
                return Expanded(
                  child: Column(
                    children: [
                      const CircularProgressIndicator(
                        strokeAlign: 3.5,
                        strokeCap: StrokeCap.round,
                        strokeWidth: 4,
                      ),
                      SizedBox(height: h * 0.0085),
                      // Text body= " 'جاري تحديد الموقع وتهيئة البيانات...'"
                      Text(
                        '6'.tr,
                        style: TextStyle(color: Colors.white38, fontSize: 14),
                      ),
                    ],
                  ),
                );
              }
              if (controler.hasInternetError.value) {
                return Coustomorsplashsecrin.erorrInternar(
                  h,
                  controler.errorMessage.value,
                  controler.retry,
                );
              }
              return SizedBox();
            }),
            //  space
            // SizedBox(height: 0.0035 * h),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
