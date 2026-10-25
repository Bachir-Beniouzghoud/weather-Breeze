import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Coustomorsplashsecrin {
  // اسم التطبيق مع دعم الثيم
  static Widget nameApp(TextTheme textTheme) {
    return Text(
      '7'.tr,
      style:
          textTheme.headlineMedium?.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ) ??
          const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
    );
  }

  // حاوية الأيقونة (تظل ثابتة ومضيئة بشكل أنيق في الثيمين)
  static Widget iconContainer() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: 0.05),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withValues(alpha: 0.2),
            blurRadius: 30,
            spreadRadius: 10,
          ),
          BoxShadow(
            color: Colors.amber.withValues(alpha: 0.2),
            blurRadius: 30,
            spreadRadius: 10,
          ),
        ],
      ),
      child: const Icon(Icons.wb_sunny_rounded, size: 90, color: Colors.amber),
    );
  }

  // العنوان الفرعي الأول مع دعم الثيم
  // ignore: non_constant_identifier_names
  static Widget Title1(TextTheme textTheme) {
    return Text(
      "5".tr,
      style: textTheme.bodySmall?.copyWith(
        fontSize: 14,
        color:
            textTheme.bodySmall?.color?.withValues(alpha: 0.7) ??
            Colors.white54,
      ),
    );
  }

  // العنوان الفرعي الثاني مع دعم الثيم
  static Widget Title(TextTheme textTheme) {
    return Text(
      "5".tr,
      style: textTheme.bodySmall?.copyWith(
        fontSize: 14,
        color:
            textTheme.bodySmall?.color?.withValues(alpha: 0.7) ??
            Colors.white54,
      ),
    );
  }

  static Widget erorrInternar(
    double h,
    String error,
    Function retry,
    TextTheme textTheme,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.wifi_off_rounded,
              size: 80,
              color: Colors.redAccent,
            ),
            SizedBox(height: h * 0.01),
            // استخدام TextTheme ليتناسب النص مع الثيم الحالي
            Text(
              error,
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: h * 0.02),
            ElevatedButton.icon(
              onPressed: () => retry(),
              icon: const Icon(Icons.refresh),
              label: Text('11'.tr, style: const TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ويدجت خاصة بخطأ خدمات الموقع
  static Widget locationErrorWidget(
    double h,
    Function retry,
    TextTheme textTheme,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // أيقونة تعبيرية لموقع متوقف
            const Icon(
              Icons.location_off_rounded,
              size: 80,
              color: Colors.orangeAccent,
            ),
            SizedBox(height: h * 0.02),

            // عنوان الخطأ
            Text(
              'خدمات الموقع غير مفعلة',
              textAlign: TextAlign.center,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // وصف توضيحي للمستخدم
            Text(
              'يرجى تفعيل نظام تحديد الموقع (GPS) في هاتفك لكي نتمكن من جلب حالة الطقس لمنطقتك بدقة.',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
              ),
            ),
            SizedBox(height: h * 0.03),
            // زر إعادة المحاولة
            ElevatedButton.icon(
              onPressed: () => retry(),
              icon: const Icon(Icons.refresh),
              label: const Text(
                'إعادة المحاولة',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
