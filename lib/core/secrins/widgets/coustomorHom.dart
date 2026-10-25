// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_utils/src/extensions/internacionalization.dart';
// import 'package:marquee/marquee.dart';
// import 'package:newproject/constent/AppColors.dart';
// import 'package:newproject/core/controlers/HomControler.dart';
// import 'package:newproject/core/modles/CurrentWeatherData.dart';

// class Coustomorhom {
//   static Homcontroler c = Homcontroler();

//   //************************* */
//   //************************* */
//   //************************* */
//   static Widget buildeTemp(CurrentWeatherData data) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         const Icon(Icons.wb_sunny, color: Colors.amber, size: 64),

//         ///tmpe
//         Text(
//           "${data.mainWeather!.temp!.round()}°",
//           style: TextStyle(
//             color: AppColors.cloud,
//             fontSize: 75,
//             fontWeight: FontWeight.bold,
//           ),
//           locale: Get.locale,
//         ),
//         //tem Max and tem Min
//         Column(
//           children: [
//             //temp Min
//             Text(
//               "${data.mainWeather!.tempMax}°",
//               style: TextStyle(
//                 color: AppColors.glassWhite,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//               locale: Get.locale,
//             ),

//             // عرض الخط الفاصل
//             Container(
//               width: 40,
//               height: 2,
//               margin: const EdgeInsets.symmetric(
//                 vertical: 2.5,
//               ), // مسافة علوية وسفلية
//               color: Colors.white70, // لون الخط
//             ),
//             //temp Min
//             Text(
//               "${data.mainWeather!.tempMin}°",
//               style: TextStyle(
//                 color: AppColors.glassWhite,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//               locale: Get.locale,
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   //********************* */
//   static Column erorr(double h, String error, Function retry) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(Icons.wifi_off_rounded, size: 80, color: Colors.redAccent),
//         SizedBox(height: h * 0.002),
//         Text(error, textAlign: TextAlign.center),
//         SizedBox(height: h * 0.005),
//         ElevatedButton.icon(
//           onPressed: () => retry(),
//           icon: Icon(Icons.refresh),
//           label: Text('11'.tr, style: TextStyle(fontSize: 20)),
//           style: ElevatedButton.styleFrom(
//             padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 1),
//             // maximumSize: Size(25.0, 10.0),
//           ),
//         ),
//       ],
//     );
//   }

//   //************ */
//   static Widget buildeHider(dynamic key, CurrentWeatherData controler ,TextTheme textTheme) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               controler.name.toString() + controler.sys!.country.toString(),
//               style: TextStyle(
//                 color: AppColors.white,
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//               locale: Get.locale,
//             ),
//             SizedBox(height: 4),
//             Text(
//               c.formatWeatherDate(controler.dt!).toString(),
//               style: TextStyle(color: Colors.white70, fontSize: 14),
//               locale: Get.locale,
//             ),
//           ],
//         ),
//         IconButton(
//           onPressed: () {
//             key.currentState
//                 ?.openDrawer(); //  Scaffold.of(context).openDrawer();
//           },
//           icon: const Icon(Icons.menu, color: Colors.white, size: 28),
//         ),
//       ],
//     );
//   }

//   // static Widget _buildDayItem(
//   //   CurrentWeatherData data,
//   //   IconData icon,
//   //   Color iconColor,
//   // ) {
//   //   return Padding(
//   //     padding: const EdgeInsets.symmetric(vertical: 8.0),
//   //     child: Row(children: [

//   //      ],),
//   //   );
//   // }

//   //************************* */
//   static Widget buildHourlyItem({
//     String? time,
//     String? description,
//     String? iconCod,
//     Color? iconColor,
//     int? humidity,
//     double? windSpeed,
//   }) {
//     if (time != null && time.contains(' ') && (time != '14'.tr)) {
//       time = time.split(' ')[1].toString();
//       time = time.substring(0, 5);
//     }
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: SizedBox(
//         width: 80,
//         // height: 400,
//         child: Column(
//           // crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             //now الان
//             Flexible(
//               child: Text(
//                 time!,
//                 maxLines: 1,
//                 style: const TextStyle(
//                   // fontWeight: FontWeight.bold,
//                   fontSize: 17,
//                   color: AppColors.white,
//                 ),
//                 locale: Get.locale,
//                 // textAlign: TextAlign.justify,
//                 softWrap: true,
//               ),
//             ),

//             // // get icon from netwoek
//             Flexible(
//               child: Image.network(
//                 c.getIconUrl(iconCod.toString()),
//                 width: 50,
//                 height: 50,
//                 color: iconColor,
//               ),
//             ),
//             // //humidity
//             Flexible(
//               child: Text(
//                 '$humidity%',
//                 maxLines: 1,
//                 style: TextStyle(
//                   fontSize: 17,
//                   color: AppColors.white,
//                   locale: Get.locale,
//                   // fontWeight: FontWeight.w100,
//                 ),
//               ),
//             ),
//             // const SizedBox(height: 4),
//             // // wind
//             Flexible(
//               child: Text(
//                 "${windSpeed!.round()}${"15".tr}",
//                 maxLines: 1,
//                 style: const TextStyle(fontSize: 17, color: AppColors.white),
//                 locale: Get.locale,
//                 // softWrap: true,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             // الوصف
//             Flexible(
//               child: Marquee(
//                 scrollAxis: Axis.horizontal,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 blankSpace: 20.2,
//                 velocity: 25.0,
//                 pauseAfterRound: const Duration(seconds: 1),
//                 startPadding: 10,
//                 accelerationCurve: Curves.linear,
//                 accelerationDuration: const Duration(microseconds: 600),
//                 decelerationCurve: Curves.easeOut,
//                 text: description ?? '',
//                 // maxLines: 1,
//                 style: const TextStyle(
//                   // fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                   color: AppColors.white,
//                 ),
//                 // locale: Get.locale,
//                 // overflow: TextOverflow.visible,
//                 // softWrap: true,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   static String formatForecastDay(String dtTxt) {
//     DateTime datetime = DateTime.parse(dtTxt);
//     DateTime Datenow = DateTime.now();
//     // تجهيز التواريخ بدون ساعات
//     DateTime dateOnly = DateTime(datetime.year, datetime.month, datetime.day);
//     DateTime todayOnly = DateTime(Datenow.year, Datenow.month, Datenow.day);
//     DateTime tomorrowOnly = todayOnly.add(const Duration(days: 1));
//     if (dateOnly == todayOnly) {
//       return 'اليوم';
//     }
//     //  إذا كان التاريخ يوافق اليوم الحالي
//     if (dateOnly == tomorrowOnly) {
//       return 'غدا';
//     } else {
//       List<String> arabicDays = [
//         "16".tr,
//         '17'.tr,
//         '18'.tr,
//         '20'.tr,
//         '21'.tr,
//         '22'.tr,
//         '21'.tr,
//       ];
//       return arabicDays[datetime.weekday - 1];
//     }
//   }

//   static Widget buildDailyRow({
//     String? tempMax,
//     String? tempMin,
//     String? Day,
//     String? description,
//     String? iconCod,
//     Color? iconColor,
//     int? humidity,
//     double? windSpeed,
//   }) {
//     print(Day);
//     print("DayBefor");
//     if (Day != null){
//       print(Day);
//       print("Day");
//       Day = formatForecastDay(Day);
//     }
//     print(Day);
//     print("Dayafter");
//     return SizedBox(
//       width: 200,
//       height: 100,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           //now الان
//           Flexible(
//             child: Text(
//               Day!,
//               maxLines: 1,
//               style: const TextStyle(
//                 // fontWeight: FontWeight.bold,
//                 fontSize: 17,
//                 color: AppColors.white,
//               ),
//               locale: Get.locale,
//               // textAlign: TextAlign.justify,
//               softWrap: true,
//             ),
//           ),

//           // // get icon from netwoek
//           Flexible(
//             child: Image.network(
//               c.getIconUrl(iconCod.toString()),
//               width: 50,
//               height: 50,
//               color: iconColor,
//             ),
//           ),
//           // //humidity
//           Flexible(
//             child: Text(
//               '$humidity%',
//               maxLines: 1,
//               style: TextStyle(
//                 fontSize: 17,
//                 color: AppColors.white,
//                 locale: Get.locale,
//                 // fontWeight: FontWeight.w100,
//               ),
//             ),
//           ),
//           // const SizedBox(height: 4),
//           // // wind
//           Flexible(
//             child: Text(
//               // ignore: dead_code
//               "${windSpeed!.round()}${"15".tr}",
//               maxLines: 1,
//               style: const TextStyle(fontSize: 17, color: AppColors.white),
//               locale: Get.locale,
//               // softWrap: true,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           // الوصف
//           Flexible(
//             child: Marquee(
//               scrollAxis: Axis.horizontal,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               blankSpace: 20.2,
//               velocity: 25.0,
//               pauseAfterRound: const Duration(seconds: 1),
//               startPadding: 10,
//               accelerationCurve: Curves.linear,
//               accelerationDuration: const Duration(microseconds: 600),
//               decelerationCurve: Curves.easeOut,
//               text: description ?? '',
//               // maxLines: 1,
//               style: const TextStyle(
//                 // fontWeight: FontWeight.bold,
//                 fontSize: 20,
//                 color: AppColors.white,
//               ),
//               // locale: Get.locale,
//               // overflow: TextOverflow.visible,
//               // softWrap: true,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:marquee/marquee.dart';
import 'package:newproject/constent/AppColors.dart';
import 'package:newproject/core/controlers/HomControler.dart';
import 'package:newproject/core/modles/CurrentWeatherData.dart';
import 'package:newproject/core/themes/ThemeController.dart';

class Coustomorhom {
  static Homcontroler c = Homcontroler();

  //************************* */
  static Widget buildeTemp(CurrentWeatherData data, TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(Icons.wb_sunny, color: Colors.amber, size: 64),

        /// tmpe
        Text(
          "${data.mainWeather!.temp!.round()}°",
          style: textTheme.headlineLarge?.copyWith(
            fontSize: 75,
            fontWeight: FontWeight.bold,
          ),
          locale: Get.locale,
        ),
        // tem Max and tem Min
        Column(
          children: [
            // temp Max
            Text(
              "${data.mainWeather!.tempMax}°",
              style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              locale: Get.locale,
            ),

            // عرض الخط الفاصل
            Container(
              width: 40,
              height: 2,
              margin: const EdgeInsets.symmetric(vertical: 2.5),
              color:
                  textTheme.bodyMedium?.color?.withValues(alpha: 0.5) ??
                  Colors.white70,
            ),
            // temp Min
            Text(
              "${data.mainWeather!.tempMin}°",
              style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              locale: Get.locale,
            ),
          ],
        ),
      ],
    );
  }

  //********************* */
  static Widget erorr(
    double h,
    String error,
    Function retry,
    TextTheme textTheme,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.wifi_off_rounded, size: 80, color: Colors.redAccent),
        SizedBox(height: h * 0.002),
        Text(error, textAlign: TextAlign.center, style: textTheme.bodyLarge),
        SizedBox(height: h * 0.005),
        ElevatedButton.icon(
          onPressed: () => retry(),
          icon: const Icon(Icons.refresh),
          label: Text('11'.tr, style: const TextStyle(fontSize: 20)),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 1),
          ),
        ),
      ],
    );
  }
  //************ */

  static Widget buildeSersh(
    TextTheme textTheme,
    ThemeController themeController,
    Homcontroler Controler,
  ) {
    // تعريف TextEditingController للتحكم بنص البحث
    final TextEditingController searchController = TextEditingController();

    // أضف هذا الحقل داخل Column في HomPag.dart:
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 20.0),
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
        color: themeController.isDarkMode.value
            ? Colors.white.withValues(alpha: 0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: searchController,
        style: textTheme.bodyLarge,
        decoration: InputDecoration(
          hintText: "39".tr, //      "39":'ابحث عن مدينة...'
          hintStyle: textTheme.bodyMedium?.copyWith(color: Colors.grey),
          prefixIcon: Icon(
            Icons.search,
            color: themeController.isDarkMode.value
                ? Colors.white70
                : Colors.blueGrey,
          ),
          filled: true,
          fillColor: themeController.isDarkMode.value
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.white.withValues(alpha: 0.8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        onSubmitted: (value) async {
          if (value.isNotEmpty) {
            await c.searchWeatherByCity(
              value,
            ); // تنفيذ البحث عند الضغط على إدخال
            searchController.clear();
            // FocusScope.of(context).unfocus();
          }
        },
        // onChanged: (value) async {
        //   if (value.isNotEmpty) {
        //     await c.searchWeatherByCity(
        //       value,
        //     ); // تنفيذ البحث عند الضغط على إدخال
        //     // searchController.clear();
        //   }
        // },
      ),
    );
  }

  //************ */
  static Widget buildeHider(
    dynamic key,
    CurrentWeatherData controler,
    TextTheme textTheme,
    ThemeController themeController, {
    Homcontroler? Controler,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: buildeSersh(textTheme, themeController, Controler!)),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controler.name.toString() +
                  (controler.sys?.country.toString() ?? ''),
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              locale: Get.locale,
            ),
            const SizedBox(height: 4),
            Text(
              c.formatWeatherDate(controler.dt!).toString(),
              style: textTheme.bodySmall,
              locale: Get.locale,
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            key.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu, color: textTheme.titleLarge?.color, size: 28),
        ),
      ],
    );
  }

  //************************* */
  static Widget buildHourlyItem({
    String? time,
    String? description,
    String? iconCod,
    Color? iconColor,
    int? humidity,
    double? windSpeed,
    required TextTheme textTheme,
  }) {
    if (time != null && time.contains(' ') && (time != '14'.tr)) {
      time = time.split(' ')[1].toString();
      time = time.substring(0, 5);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // now الان
            Flexible(
              child: Text(
                time!,
                maxLines: 1,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
                locale: Get.locale,
                softWrap: true,
              ),
            ),

            // get icon from network
            Flexible(
              child: Image.network(
                c.getIconUrl(iconCod.toString()),
                width: 50,
                height: 50,
                color: iconColor,
              ),
            ),
            // humidity
            Flexible(
              child: Text(
                '$humidity%',
                maxLines: 1,
                style: textTheme.bodyMedium?.copyWith(fontSize: 17),
                locale: Get.locale,
              ),
            ),
            // wind
            Flexible(
              child: Text(
                "${windSpeed!.round()}${"15".tr}",
                maxLines: 1,
                style: textTheme.bodyMedium?.copyWith(fontSize: 17),
                locale: Get.locale,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // الوصف
            Flexible(
              child: Marquee(
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                blankSpace: 20.2,
                velocity: 25.0,
                pauseAfterRound: const Duration(seconds: 1),
                startPadding: 10,
                accelerationCurve: Curves.linear,
                accelerationDuration: const Duration(microseconds: 600),
                decelerationCurve: Curves.easeOut,
                text: description ?? '',
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String formatForecastDay(String dtTxt) {
    DateTime datetime = DateTime.parse(dtTxt);
    DateTime Datenow = DateTime.now();
    DateTime dateOnly = DateTime(datetime.year, datetime.month, datetime.day);
    DateTime todayOnly = DateTime(Datenow.year, Datenow.month, Datenow.day);
    DateTime tomorrowOnly = todayOnly.add(const Duration(days: 1));
    if (dateOnly == todayOnly) {
      return 'اليوم';
    }
    if (dateOnly == tomorrowOnly) {
      return 'غدا';
    } else {
      List<String> arabicDays = [
        "16".tr,
        '17'.tr,
        '18'.tr,
        '20'.tr,
        '21'.tr,
        '22'.tr,
        '21'.tr,
      ];
      return arabicDays[datetime.weekday - 1];
    }
  }

  static Widget buildDailyRow({
    String? tempMax,
    String? tempMin,
    String? Day,
    String? description,
    String? iconCod,
    Color? iconColor,
    int? humidity,
    double? windSpeed,
    required TextTheme textTheme,
  }) {
    if (Day != null) {
      Day = formatForecastDay(Day);
    }
    return SizedBox(
      width: 200,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Day
          Flexible(
            child: Text(
              Day!,
              maxLines: 1,
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              locale: Get.locale,
              softWrap: true,
            ),
          ),

          // Icon
          Flexible(
            child: Image.network(
              c.getIconUrl(iconCod.toString()),
              width: 50,
              height: 50,
              color: iconColor,
            ),
          ),
          // Humidity
          Flexible(
            child: Text(
              '$humidity%',
              maxLines: 1,
              style: textTheme.bodyMedium?.copyWith(fontSize: 17),
              locale: Get.locale,
            ),
          ),
          // Wind
          Flexible(
            child: Text(
              "${windSpeed!.round()}${"15".tr}",
              maxLines: 1,
              style: textTheme.bodyMedium?.copyWith(fontSize: 17),
              locale: Get.locale,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Description
          Flexible(
            child: Marquee(
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              blankSpace: 20.2,
              velocity: 25.0,
              pauseAfterRound: const Duration(seconds: 1),
              startPadding: 10,
              accelerationCurve: Curves.linear,
              accelerationDuration: const Duration(microseconds: 600),
              decelerationCurve: Curves.easeOut,
              text: description ?? '',
              style: textTheme.bodyMedium?.copyWith(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
