import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/route_manager.dart';
import 'package:newproject/core/bindings/bindings.dart';
import 'package:newproject/core/secrins/viwes/SplashScren.dart';
import 'package:newproject/core/secrins/viwes/hompage.dart';

class Apppages {
  static final routes = [
    GetPage(
      name: '/home',
      page: () => HomPag(),
      binding: HomeBinding(),
      transition: Transition.native,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: '/SplashSecrin',
      page: () => SplashScreen(),
      binding: spalshBinding(),
      transition: Transition.native,
      transitionDuration: const Duration(seconds: 1),
    ),
  ];
}
