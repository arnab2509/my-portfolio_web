import 'package:get/get.dart';
import 'package:portfolio_web/app/modules/home/views/home_view.dart';
import 'package:portfolio_web/app/modules/home/bindings/home_binding.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
} 