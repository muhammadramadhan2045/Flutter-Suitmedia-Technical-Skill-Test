import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/controller/user_controller.dart';
import 'package:suitmedia_test/screen/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SelectedUserController());
    return GetMaterialApp(
      title: 'Suitmedia Technical Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const FirstScreen(),
    );
  }
}
