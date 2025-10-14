import 'package:advocateoffice/controller/ui/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/animations/splash.json', 
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
