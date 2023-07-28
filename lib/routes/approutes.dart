import 'package:ecommerce_app/screen/auth/bindings/login_binding.dart';
import 'package:ecommerce_app/screen/home/bindings/home_binding.dart';
import 'package:ecommerce_app/screen/splash_screen/bindings/splash_screen_binding.dart';

import '../screen/auth/views/login_view.dart';
import '../screen/home/views/home_view.dart';
import '../screen/splash_screen/views/splash_screen_view.dart';

class AppRoutes {
  static const splashScreen = '/';
  static const loginScreen = '/login';
  static const homeScreen = '/home';

  static final routes = {
    splashScreen: (context, dynamic args) => const SplashScreenView(),
    loginScreen: (context, dynamic args) => const LoginView(),
    homeScreen: (context, dynamic args) => const HomeView(),
  };

  static final bindings = {
    LoginBinding: LoginBinding(),
    SplashScreenBinding: SplashScreenBinding(),
    HomeBinding: HomeBinding(),
  };
}
