// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:newproject/constent/AppColors.dart';
// import 'package:newproject/core/controlers/HomControler.dart';
// import 'package:newproject/core/modles/CurrentForecastData.dart';
// import 'package:newproject/core/modles/forecastItem.dart';
// import 'package:newproject/core/secrins/viwes/WeatherDrawer.dart';
// import 'package:newproject/core/secrins/widgets/coustomorHom.dart';
// import 'package:newproject/core/themes/ThemeController.dart';

// class HomPag extends StatelessWidget {
//   HomPag({super.key});

//   // حقن الكంటترولرات بشكل صحيح
//   final Homcontroler Controler = Get.find<Homcontroler>();
//   final ThemeController themeController = Get.find<ThemeController>();
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.sizeOf(context).height;
//     final textTheme = Theme.of(context).textTheme;
//     return Scaffold(
//       key: scaffoldKey,
//       drawer: weatherDrawer(C: Controler, themeController: themeController),
//       // تغليف الشاشة بـ Obx لكي تتفاعل مع التدرج اللوني فور تغيير الثيم
//       body: Obx(() {
//         return Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: BoxDecoration(
//             gradient: themeController.currentGradient.value, // التدرج التفاعلي
//           ),
//           child: SafeArea(
//             child: Obx(() {
//               if (Controler.isloding.value) {
//                 return const Center(
//                   child: CircularProgressIndicator(
//                     strokeAlign: 3.5,
//                     strokeCap: StrokeCap.round,
//                     strokeWidth: 4,
//                   ),
//                 );
//               } else {
//                 // جلب البيانات بطريقة آمنة داخل الـ Build لمنع أخطاء الـ late
//                 final data = Controler.currentWeatherData.value;
//                 final Currentforecastdata Datafrocce =
//                     Controler.currentforecastdata.value;

//                 return Controler.errorMessage.value.isEmpty
//                     ? Padding(
//                         padding: const EdgeInsets.all(10),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: [
//                             // الشريط العلوي (المدينة والتاريخ)
//                             Coustomorhom.buildeHider(
//                               scaffoldKey,
//                               data,
//                               textTheme,
//                             ),
//                             SizedBox(height: h * 0.0045),
//                             // الوصف
//                             Text(
//                               data.weather?[0].description ?? '',
//                               style: textTheme.bodyLarge,
//                             ),
//                             Expanded(
//                               child: SingleChildScrollView(
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     // قسم الحرارة الرئيسية
//                                     Coustomorhom.buildeTemp(data),
//                                     const SizedBox(height: 10),

//                                     // توقعات الساعات
//                                     Container(
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                         color: AppColors.deepBlue.withValues(
//                                           alpha: 0.5,
//                                         ),
//                                         borderRadius: BorderRadius.circular(24),
//                                         border: Border.all(
//                                           color: Colors.white.withValues(
//                                             alpha: 0.15,
//                                           ),
//                                           width: 1.2,
//                                         ),
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color: Colors.black.withValues(
//                                               alpha: 0.35,
//                                             ),
//                                             blurRadius: 20,
//                                             spreadRadius: 2,
//                                             offset: const Offset(0, 8),
//                                           ),
//                                         ],
//                                       ),
//                                       child: SizedBox(
//                                         width: double.infinity,
//                                         height: h * 0.35,
//                                         child: ListView.builder(
//                                           scrollDirection: Axis.horizontal,
//                                           itemCount:
//                                               Datafrocce.list != null &&
//                                                   Datafrocce.list!.length >= 9
//                                               ? 9
//                                               : (Datafrocce.list?.length ?? 0),
//                                           itemBuilder: (context, index) {
//                                             if (index == 0) {
//                                               return Coustomorhom.buildHourlyItem(
//                                                 time: '14'.tr,
//                                                 iconCod: data.weather?[0].icon,
//                                                 humidity:
//                                                     data.mainWeather?.humidity,
//                                                 description: data
//                                                     .weather?[0]
//                                                     .description,
//                                                 windSpeed: data.wind?.speed,
//                                               );
//                                             }
//                                             final item =
//                                                 Datafrocce.list![index - 1];
//                                             return Coustomorhom.buildHourlyItem(
//                                               time: item.dtTxt,
//                                               iconCod: item.weather?[0].icon,
//                                               description:
//                                                   item.weather?[0].description,
//                                               humidity: item
//                                                   .mainForecast
//                                                   ?.mainWeather
//                                                   ?.humidity,
//                                               windSpeed: item.wind?.speed,
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(height: 20),

//                                     // توقعات الأيام
//                                     Container(
//                                       height: 410,
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                         color: AppColors.deepBlue.withValues(
//                                           alpha: 0.5,
//                                         ),
//                                         borderRadius: BorderRadius.circular(24),
//                                         border: Border.all(
//                                           color: Colors.white.withValues(
//                                             alpha: 0.15,
//                                           ),
//                                           width: 1.2,
//                                         ),
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color: Colors.black.withValues(
//                                               alpha: 0.35,
//                                             ),
//                                             blurRadius: 20,
//                                             spreadRadius: 2,
//                                             offset: const Offset(0, 8),
//                                           ),
//                                         ],
//                                       ),
//                                       child: SizedBox(
//                                         width: double.infinity,
//                                         height: h * 0.40,
//                                         child: ListView.builder(
//                                           shrinkWrap: true,
//                                           itemCount: Controler.removeReplit(
//                                             Datafrocce.list != null &&
//                                                     Datafrocce.list!.length >=
//                                                         40
//                                                 ? Datafrocce.list!
//                                                       .getRange(8, 40)
//                                                       .toList()
//                                                 : [],
//                                           ).length,
//                                           itemBuilder: (context, index) {
//                                             List<forecastItem>
//                                             Hasdata = Controler.removeReplit(
//                                               Datafrocce.list != null &&
//                                                       Datafrocce.list!.length >=
//                                                           40
//                                                   ? Datafrocce.list!
//                                                         .getRange(8, 40)
//                                                         .toList()
//                                                   : [],
//                                             );
//                                             return Coustomorhom.buildDailyRow(
//                                               Day: Hasdata[index].dtTxt,
//                                               iconCod: Hasdata[index]
//                                                   .weather?[0]
//                                                   .icon,
//                                               description: Hasdata[index]
//                                                   .weather?[0]
//                                                   .description,
//                                               humidity: Hasdata[index]
//                                                   .mainForecast
//                                                   ?.mainWeather
//                                                   ?.humidity,
//                                               windSpeed:
//                                                   Hasdata[index].wind?.speed,
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     : Coustomorhom.erorr(
//                         h,
//                         Controler.errorMessage.value,
//                         Controler.retry,
//                       );
//               }
//             }),
//           ),
//         );
//       }),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/core/controlers/HomControler.dart';
import 'package:newproject/core/modles/CurrentForecastData.dart';
import 'package:newproject/core/modles/forecastItem.dart';
import 'package:newproject/core/secrins/viwes/WeatherDrawer.dart';
import 'package:newproject/core/secrins/widgets/coustomorHom.dart';
import 'package:newproject/core/themes/ThemeController.dart';

class HomPag extends StatelessWidget {
  HomPag({super.key});

  // حقن الكنترولرات بشكل صحيح
  final Homcontroler Controler = Get.find<Homcontroler>();
  final ThemeController themeController = Get.put(ThemeController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;

    // جلب TextTheme من الثيم الحالي للتطبيق
    final textTheme = Theme.of(context).textTheme;
    late final bool isDark = themeController.isDarkMode.value;
    return Scaffold(
      key: scaffoldKey,
      drawer: weatherDrawer(C: Controler, themeController: themeController),
      body: Obx(
           ()=> Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient:
                themeController.currentGradient.value, // التدرج التفاعلي
          ),
          child: SafeArea(
            child: Obx(() {
              if (Controler.isloding.value) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeAlign: 3.5,
                    strokeCap: StrokeCap.round,
                    strokeWidth: 4,
                  ),
                );
              } else {
                // جلب البيانات بطريقة آمنة داخل الـ Build لمنع أخطاء الـ late
                final data = Controler.currentWeatherData.value;
                final Currentforecastdata Datafrocce =
                    Controler.currentforecastdata.value;
                return Controler.errorMessage.value.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // الشريط العلوي (المدينة والتاريخ) مع تمرير textTheme
                            Coustomorhom.buildeHider(
                              scaffoldKey,
                              data,
                              textTheme,
                              themeController,
                              Controler: Controler,
                            ),
                            // Coustomorhom.buildeSersh(
                            //   textTheme,
                            //   themeController,
                            //   Controler,
                            // ),
                            SizedBox(height: h * 0.0045),
        
                            // الوصف (يستخدم textTheme.bodyLarge ويتكيف تلقائياً)
                            Text(
                              data.weather?[0].description ?? '',
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // قسم الحرارة الرئيسية
                                    Coustomorhom.buildeTemp(data, textTheme),
                                    const SizedBox(height: 10),
        
                                    // توقعات الساعات
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(
                                          24,
                                        ),
                                        border: Border.all(
                                          color: isDark
                                              ? Colors.white.withValues(
                                                  alpha: 0.15,
                                                )
                                              : Colors.blue.withValues(
                                                  alpha: 0.15,
                                                ),
                                          width: 1.2,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: isDark
                                                ? Colors.black.withValues(
                                                    alpha: 0.35,
                                                  )
                                                : Colors.blue.withValues(
                                                    alpha: 0.08,
                                                  ),
                                            blurRadius: 20,
                                            spreadRadius: 2,
                                            offset: const Offset(0, 8),
                                          ),
                                        ],
                                      ),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: h * 0.35,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              Datafrocce.list != null &&
                                                  Datafrocce.list!.length >= 9
                                              ? 9
                                              : (Datafrocce.list?.length ??
                                                    0),
                                          itemBuilder: (context, index) {
                                            if (index == 0) {
                                              return Coustomorhom.buildHourlyItem(
                                                textTheme: textTheme,
                                                time: '14'.tr,
                                                iconCod:
                                                    data.weather?[0].icon,
                                                humidity: data
                                                    .mainWeather
                                                    ?.humidity,
                                                description: data
                                                    .weather?[0]
                                                    .description,
                                                windSpeed: data.wind?.speed,
                                              );
                                            }
                                            final item =
                                                Datafrocce.list![index - 1];
                                            return Coustomorhom.buildHourlyItem(
                                              textTheme: textTheme,
                                              time: item.dtTxt,
                                              iconCod: item.weather?[0].icon,
                                              description: item
                                                  .weather?[0]
                                                  .description,
                                              humidity: item
                                                  .mainForecast
                                                  ?.mainWeather
                                                  ?.humidity,
                                              windSpeed: item.wind?.speed,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
        
                                    // توقعات الأيام
                                    Container(
                                      height: 410,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(
                                          24,
                                        ),
                                        border: Border.all(
                                          color: isDark
                                              ? Colors.white.withValues(
                                                  alpha: 0.15,
                                                )
                                              : Colors.blue.withValues(
                                                  alpha: 0.15,
                                                ),
                                          width: 1.2,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: isDark
                                                ? Colors.black.withValues(
                                                    alpha: 0.35,
                                                  )
                                                : Colors.blue.withValues(
                                                    alpha: 0.08,
                                                  ),
                                            blurRadius: 20,
                                            spreadRadius: 2,
                                            offset: const Offset(0, 8),
                                          ),
                                        ],
                                      ),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: h * 0.40,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: Controler.removeReplit(
                                            Datafrocce.list != null &&
                                                    Datafrocce.list!.length >=
                                                        40
                                                ? Datafrocce.list!
                                                      .getRange(8, 40)
                                                      .toList()
                                                : [],
                                          ).length,
                                          itemBuilder: (context, index) {
                                            List<forecastItem> Hasdata =
                                                Controler.removeReplit(
                                                  Datafrocce.list != null &&
                                                          Datafrocce
                                                                  .list!
                                                                  .length >=
                                                              40
                                                      ? Datafrocce.list!
                                                            .getRange(8, 40)
                                                            .toList()
                                                      : [],
                                                );
                                            return Coustomorhom.buildDailyRow(
                                              textTheme: textTheme,
                                              Day: Hasdata[index].dtTxt,
                                              iconCod: Hasdata[index]
                                                  .weather?[0]
                                                  .icon,
                                              description: Hasdata[index]
                                                  .weather?[0]
                                                  .description,
                                              humidity: Hasdata[index]
                                                  .mainForecast
                                                  ?.mainWeather
                                                  ?.humidity,
                                              windSpeed:
                                                  Hasdata[index].wind?.speed,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Coustomorhom.erorr(
                        h,
                        Controler.errorMessage.value,
                        Controler.retry,
                        textTheme,
                      );
              }
            }),
          ),
        ),
      ),
    );
  }
}
