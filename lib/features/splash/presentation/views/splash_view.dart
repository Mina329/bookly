import 'package:flutter/material.dart';
import 'package:bookly/features/splash/presentation/views/widgets/splash_body.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body:  SplashBody());
  }
}