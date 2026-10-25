import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Coustomorsplashsecrin {
  static Widget nameApp() {
    return Text(
      '7'.tr,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: 1.2,
      ),
    );
  }

  static Widget IconContainer() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.05),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.2),
            blurRadius: 30,
            spreadRadius: 10,
          ),
          BoxShadow(
            color: Colors.amber.withOpacity(0.2),
            blurRadius: 30,
            spreadRadius: 10,
          ),
        ],
      ),
      child: const Icon(Icons.wb_sunny_rounded, size: 90, color: Colors.amber),
    );
  }

  // ignore: non_constant_identifier_names
  static Widget Title1() {
    return Text("5".tr, style: TextStyle(fontSize: 14, color: Colors.white54));
  }

  static Widget Title() {
    return  Text("5".tr, style: TextStyle(fontSize: 14, color: Colors.white54));
  }

  static Widget erorrInternar(double h, String Error, Function Retry) {
    return Expanded(
      child: Column(
        children: [
          Icon(Icons.wifi_off_rounded, size: 80, color: Colors.redAccent),
          SizedBox(height: h * 0.002),
          Text(Error, textAlign: TextAlign.center),
          SizedBox(height: h * 0.005),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => Retry(),
              icon: Icon(Icons.refresh),
              label: Text('11'.tr, style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 1,
                ),

                // maximumSize: Size(25.0, 10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
