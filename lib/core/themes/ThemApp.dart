// import 'package:flutter/material.dart';
// import 'package:newproject/constent/AppColors.dart';

// class Themapp {
//   static ThemeData weatherTheme = ThemeData(
//     brightness: Brightness.dark,

//     scaffoldBackgroundColor: AppColors.deepBlue,

//     colorScheme: const ColorScheme.dark(
//       primary: AppColors.skyLight,
//       secondary: AppColors.skyLight,
//       surface: AppColors.nightBlue,
//     ),

//     appBarTheme: const AppBarTheme(
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       foregroundColor: AppColors.white,
//     ),

//     textTheme: const TextTheme(
//       headlineLarge: TextStyle(
//         color: AppColors.textPrimary,
//         fontSize: 32,
//         fontWeight: FontWeight.w500,
//       ),

//       headlineMedium: TextStyle(
//         color: AppColors.textPrimary,
//         fontSize: 26,
//         fontWeight: FontWeight.w500,
//       ),

//       titleLarge: TextStyle(
//         color: AppColors.textPrimary,
//         fontSize: 20,
//         fontWeight: FontWeight.w500,
//       ),

//       titleMedium: TextStyle(color: AppColors.textSecondary, fontSize: 16),

//       bodyLarge: TextStyle(color: AppColors.textPrimary, fontSize: 16),

//       bodyMedium: TextStyle(color: AppColors.textSecondary, fontSize: 14),

//       bodySmall: TextStyle(color: AppColors.textSecondary, fontSize: 12),
//     ),

//     iconTheme: const IconThemeData(color: AppColors.white, size: 22),

//     dividerTheme: const DividerThemeData(
//       color: AppColors.glassBorder,
//       thickness: 1,
//     ),
//   );
// }
import 'package:flutter/material.dart';
import 'package:newproject/constent/AppColors.dart';

class Themapp {
  // Dark Theme
  static ThemeData weatherTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.deepBlue,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.skyLight,
      secondary: AppColors.skyLight,
      surface: AppColors.nightBlue,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: AppColors.white,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 26,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(color: AppColors.textSecondary, fontSize: 16),
      bodyLarge: TextStyle(color: AppColors.textPrimary, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.textSecondary, fontSize: 14),
      bodySmall: TextStyle(color: AppColors.textSecondary, fontSize: 12),
    ),
    iconTheme: const IconThemeData(color: AppColors.white, size: 22),
    dividerTheme: const DividerThemeData(
      color: AppColors.glassBorder,
      thickness: 1,
    ),
    // تخصيص شكل ElevatedButton للوضع الداكن
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF2563EB), // لون الزر الأزرق الملكي
        foregroundColor: Colors.white, // لون النص والأيقونات داخل الزر
        elevation: 2, // ارتفاع الظل
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 14,
        ), // الهوامش الداخلية
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14), // حواف دائرية أنيقة
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          // fontFamily: 'Cairo', // أو نوع الخط المستخدم في تطبيقك
        ),
      ),
    ),
  );
  // *************************************
  // *************************************
  // *************************************
  // Light Theme عصري ومصمم خصيصاً لتطبيقات الطقس
  static ThemeData weatherLightTheme = ThemeData(
    brightness: Brightness.light,

    // خلفية سماوية فاتحة مريحة للعين بدلاً من الأبيض الناصع
    scaffoldBackgroundColor: const Color(0xFFEBF3FA),

    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xFFE2EDF8), // لون خلفية القائمة الجانبية
    ),

    colorScheme: const ColorScheme.light(
      primary: Color(0xFF2563EB), // أزرق حيوي وواضح (Royal Blue)
      secondary: Color(0xFF0284C7), // أزرق سماوي
      surface: Colors.white, // أسطح البطاقات والعناصر
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Color(0xFF0F172A),
    ),
    // أضف هذا داخل weatherLightTheme و weatherTheme في كلاس Themapp
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white; // لون الدائرة المفعّلة
        }
        return Colors.grey.shade500; // لون الدائرة غير المفعّلة
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFF2563EB); // لون المسار المفعّل
        }
        return Colors.grey.shade300; // لون المسار غير المفعّل
      }),
    ),
    // نصوص حادة وواضحة جداً بألوان كحلية داكنة (Slate / Navy)
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Color(0xFF0F172A),
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: Color(0xFF0F172A),
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: Color(0xFF0F172A),
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: Color(0xFF1E293B), // أزرق كحلي داكن وواضح لقوائم Drawer
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(color: Color(0xFF0F172A), fontSize: 16),
      bodyMedium: TextStyle(
        color: Color(0xFF475569), // رمادي كحلي متناسق للترجمات والفرعيات
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(color: Color(0xFF64748B), fontSize: 12),
    ),

    iconTheme: const IconThemeData(color: Color(0xFF1E293B), size: 22),

    dividerTheme: const DividerThemeData(
      color: Color(0xFF2563EB), // خط فاصل ناعم وواضح
      thickness: 1,
    ),
    // تخصيص شكل ElevatedButton للوضع الفاتح
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(
          0xFF2563EB,
        ), // أزرق سماوي حيوي للوضع الفاتح
        foregroundColor: Colors.white, // لون النص أبيض ناصع
        elevation: 3, // ظل أوضح قليلاً للوضع الفاتح
        shadowColor: const Color(0xFF0284C7)
            .withValues(alpha: 0.3), // لون ظل أزرق ناعم
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          // fontFamily: 'Cairo',
        ),
      ),
    ),
  );
 
}
