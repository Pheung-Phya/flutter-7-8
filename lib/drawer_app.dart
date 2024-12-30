import 'package:darklight/profile.dart';
import 'package:darklight/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Image.asset('assets/image.png')),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('H O M E'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('P R O F I L E'),
            onTap: () {
              Get.back();
              Get.to(const Profile());
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('S E T T I N G S'),
            onTap: () {
              Get.back();
              Get.to(SettingPage());
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                onPressed: () {},
                child: const Text('L O G  O U T')),
          )
        ],
      ),
    );
  }
}
