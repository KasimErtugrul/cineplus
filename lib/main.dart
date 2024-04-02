import 'package:cineplus/app/screens/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.changeTheme(ThemeData.light(useMaterial3: true));
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CinePlus(),
    );
  }
}
