import 'package:get/get.dart';
import 'package:pp_cashier/bindings/home.binding.dart';
import 'package:pp_cashier/uis/home/home.screen.dart';
import 'package:pp_cashier/uis/initial/initial.screen.dart';
import 'package:pp_cashier/uis/not-found/notfound.screen.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.home;

  static final notFoundRoute =
      GetPage(name: '/404', page: () => const NotFoundScreen());

  static final routes = [
    GetPage(
      name: Routes.initial,
      page: () => const InitialScreen(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
