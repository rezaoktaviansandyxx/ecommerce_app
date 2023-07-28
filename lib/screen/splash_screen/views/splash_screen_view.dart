import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce_app/screen/auth/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SplashScreenController());
    return Scaffold(
        body: Center(
            child: AnimatedSplashScreen(
      splash: Image.asset('images/SplashScreen.png'),
      splashIconSize: 300,
      nextScreen:
          // const LoginView(),
          controller.getToken() != null ? const HomeView() : const LoginView(),
    )));
  }

  // _isFirstLogin() {
  //   final Future<StorageService> storage = StorageService().init();
  //   return FutureBuilder<StorageService>(
  //     future: storage,
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           final String? token = snapshot.data!.read(GetStorageKey.token);
  //           if (token != null) {
  //             // If token is not null, navigate to the home screen
  //             return const HomeView();
  //           }
  //         }
  //         // If token is null or shared preferences haven't been initialized yet, navigate to the login screen
  //         return const LoginView();
  //       });
  // }
}
