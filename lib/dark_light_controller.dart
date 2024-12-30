import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkLightController extends GetxController {
  var change = false.obs;

  void toggleTheme() {
    change.value = !change.value;
    Get.changeTheme(change.value ? ThemeData.dark() : ThemeData.light());
  }
}
