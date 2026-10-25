import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:newproject/core/controlers/HomControler.dart';
import 'package:newproject/core/controlers/SplashControler.dart';

class spalshBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Splashcontroler(), fenix: true);
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Homcontroler(), fenix: true);
  }
}
