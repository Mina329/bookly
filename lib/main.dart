import 'package:bookly/contants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: kPrimaryColor
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
