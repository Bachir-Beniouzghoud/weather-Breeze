import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/constent/AppColors.dart';
import 'package:newproject/core/controlers/SplashControler.dart';
import 'package:newproject/core/secrins/widgets/coustomorSplashSecrin.dart';
import 'package:newproject/core/themes/ThemeController.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final Splashcontroler controler = Get.find();
  final ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    // جلب TextTheme من السيم الحالي للتطبيق
    final textTheme = Theme.of(context).textTheme;
    double h = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Obx(
        () => Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: themeController.currentGradient.value,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),

              // 1. أيقونة الشعار مع تأثر الظل الملون
              Coustomorsplashsecrin.iconContainer(),
              SizedBox(height: h * 0.008),

              // 2. اسم التطبيق المتكيف مع الثيم
              Coustomorsplashsecrin.nameApp(textTheme),
              SizedBox(height: h * 0.00794),

              // 3. وصف التطبيق الفرعي المتكيف مع الثيم ("توقع الطقس في كل لحظة")
              Coustomorsplashsecrin.Title(textTheme),

              const Spacer(),

              // 4. قسم التحميل والتنبيهات التفاعلي
              Obx(() {
                if (controler.isLoading.value) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircularProgressIndicator(
                        strokeAlign: 3.5,
                        strokeCap: StrokeCap.round,
                        strokeWidth: 4,
                      ),
                      SizedBox(height: h * 0.0085),
                      Text(
                        '6'.tr, // "جاري تحديد الموقع وتهيئة البيانات..."
                        style: textTheme.bodySmall?.copyWith(
                          color:
                              textTheme.bodySmall?.color?.withValues(
                                alpha: 0.6,
                              ) ??
                              Colors.white38,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  );
                }

                if (controler.hasInternetError.value) {
                  return Coustomorsplashsecrin.erorrInternar(
                    h,
                    controler.errorMessage.value,
                    controler.retry,
                    textTheme,
                  );
                }

                return const SizedBox.shrink();
              }),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
