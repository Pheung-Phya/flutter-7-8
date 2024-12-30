<<<<<<< HEAD
import 'package:darklight/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
=======
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_storage1/home_page.dart';
>>>>>>> 1ce48d2 (shared pref)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage());
  }
}
