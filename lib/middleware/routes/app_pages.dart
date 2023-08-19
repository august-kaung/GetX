import 'package:get/get.dart';
import 'package:getx_testing/middleware/modules/home/home_binding.dart';
import 'package:getx_testing/middleware/modules/home/home_page.dart';
import 'package:getx_testing/middleware/modules/login/login_binding.dart';
import 'package:getx_testing/middleware/modules/splash/splash_view.dart';
import 'package:getx_testing/middleware/routes/app_routes.dart';

import '../modules/login/login_view.dart';
import '../modules/splash/splash_binding.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
        name: Routes.splash,
        page: () => MiddlewareSplashPage(),
        binding: MiddlewareSplashBinding()),
    GetPage(
        name: Paths.home,
        page: () => MiddlewareHomePage(),
        binding: MiddlewareHomeBinding()),
    GetPage(
        name: Routes.login,
        page: () => MiddlewareLoginPage(),
        binding: MiddlewareLoginBinding())
  ];
}
