import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class Internate extends GetxService {
  Future<Internate> init() async {
    return this;
  }

  Future<bool> checkInternet() async {
    final List<ConnectivityResult> connectivityResult = await Connectivity()
        .checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }
}
