import 'package:get/get.dart';

import '../modules/Dashboard/bindings/dashboard_binding.dart';
import '../modules/Dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.root;

  static final routes = [
    GetPage(
        name: _Paths.root,
        page: () => const RootView(),
        binding: RootBinding(),
        children: [
          GetPage(
            name: _Paths.login,
            page: () => const LoginView(),
            binding: LoginBinding(),
          ),
          GetPage(
            name: _Paths.dashboard,
            page: () => const DashboardView(),
            binding: DashboardBinding(),
          ),
          GetPage(
            name: _Paths.home,
            page: () => const HomeView(),
            binding: HomeBinding(),
          ),
        ]),
  ];
}
