import 'package:get/get.dart';

import '../modules/category/bindings/category_binding.dart';
import '../modules/category/views/category_add.dart';
import '../modules/category/views/category_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/preorders/bindings/preorders_binding.dart';
import '../modules/preorders/views/preorders_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/add_product.dart';
import '../modules/product/views/product_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/rating/bindings/rating_binding.dart';
import '../modules/rating/views/rating_view.dart';
import '../modules/reports/bindings/reports_binding.dart';
import '../modules/reports/views/reports_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';
import '../modules/version_check/bindings/version_check_binding.dart';
import '../modules/version_check/views/version_check_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.root;

  static final routes = [
    GetPage(
        name: _Paths.root,
        page: () => const RootView(),
        binding: RootBinding(),
        // participatesInRootNavigator: true,
        // preventDuplicates: true,
        children: [
          GetPage(
            name: _Paths.login,
            transition: Transition.fade,
            page: () => const LoginView(),
            binding: LoginBinding(),
          ),
          GetPage(
            name: _Paths.home,
            transition: Transition.noTransition,
            page: () => const HomeView(),
            binding: HomeBinding(),
          ),
          GetPage(
            name: _Paths.preorder,
            transition: Transition.noTransition,
            page: () => const PreordersView(),
            binding: PreordersBinding(),
          ),
          GetPage(
              name: _Paths.product,
              transition: Transition.noTransition,
              page: () => const ProductView(),
              binding: ProductBinding(),
              children: [
                GetPage(
                  name: _Paths.productAdd,
                  transition: Transition.noTransition,
                  page: () => const ProductAdd(),
                  binding: ProductBinding(),
                ),
              ]),
          GetPage(
            name: _Paths.rating,
            transition: Transition.noTransition,
            page: () => const RatingView(),
            binding: RatingBinding(),
          ),
          GetPage(
            name: _Paths.profile,
            transition: Transition.noTransition,
            page: () => const ProfileView(),
            binding: ProfileBinding(),
          ),
          GetPage(
              name: _Paths.category,
              transition: Transition.noTransition,
              page: () => const CategoryView(),
              binding: CategoryBinding(),
              children: [
                GetPage(
                  name: _Paths.categoryAdd,
                  transition: Transition.noTransition,
                  page: () => const CategoryAdd(),
                  binding: CategoryBinding(),
                ),
              ]),
          GetPage(
            name: _Paths.versionCheck,
            page: () => const VersionCheckView(),
            binding: VersionCheckBinding(),
          ),
        ]),
    GetPage(
      name: _Paths.REPORTS,
      page: () => const ReportsView(),
      binding: ReportsBinding(),
    ),
  ];
}
