import 'package:get/get.dart';

import '../modules/add_produk/bindings/add_produk_binding.dart';
import '../modules/add_produk/views/add_produk_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_admin/bindings/home_admin_binding.dart';
import '../modules/home_admin/views/home_admin_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/peran/bindings/peran_binding.dart';
import '../modules/peran/views/peran_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashScreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.PERAN,
      page: () => const PeranView(),
      binding: PeranBinding(),
    ),
    GetPage(
      name: _Paths.HOME_ADMIN,
      page: () => const HomeAdminView(),
      binding: HomeAdminBinding(),
    ),
    // GetPage(
    //   name: _Paths.MAP,
    //   page: () => MapView(),
    //   binding: MapBinding(),
    // ),
    GetPage(
      name: _Paths.ADD_PRODUK,
      page: () => AddProdukView(),
      binding: AddProdukBinding(),
    ),
  ];
}
