import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dark_light_controller.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final darkLightController = Get.put(DarkLightController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 142, 141, 139),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Change Theme'),
                  Obx(
                    () => Switch(
                      value: darkLightController.change.value,
                      onChanged: (value) {
                        darkLightController.toggleTheme();
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
