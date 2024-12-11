import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/splashscreen_controller.dart';

class SplashScreenView extends GetView<SplashscreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), (() {
      // if (FirebaseAuth.instance.currentUser != null &&
      //     FirebaseAuth.instance.currentUser!.emailVerified) {
      //   Get.offAllNamed(Routes.HOME);
      // } else {
      //   Get.offAllNamed(Routes.LOGIN);
      // }
      Get.offAllNamed(Routes.HOME_ADMIN);
    }));
    return Scaffold(
      body: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/bg.png'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Center(
          child: Container(
            width: 500,
            height: 500,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo.png'),
                scale: 2,
              ),
            ),
          ),
        ),
      )
    );
  }
}
