import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/modules/category/views/category_add.dart';


import '../modules/category/bindings/category_binding.dart';
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
          // GetPage(
          //   name: _Paths.dashboard,
          //   page: () => const DashboardView(),
          //   binding: DashboardBinding(),
          // ),
          GetPage(
            name: _Paths.home,
            page: () => const HomeView(),
            binding: HomeBinding(),
          ),
          GetPage(
            name: _Paths.preorder,
            page: () => const PreordersView(),
            binding: PreordersBinding(),
          ),
          GetPage(
            name: _Paths.product,
            page: () => const ProductView(),
            binding: ProductBinding(),
          ),
          GetPage(
            name: _Paths.productAdd,
            page: () => const ProductAdd(),
            binding: ProductBinding(),
          ),
          GetPage(
            name: _Paths.rating,
            page: () => const RatingView(),
            binding: RatingBinding(),
          ),
          GetPage(
            name: _Paths.profile,
            page: () => const ProfileView(),
            binding: ProfileBinding(),
          ),
          GetPage(
            name: _Paths.category,
            page: () => const CategoryView(),
            binding: CategoryBinding(),
          ),
            GetPage(
            name: _Paths.categoryAdd,
            page: () => const CategoryAdd(),
            binding: CategoryBinding(),
          ),
        ]),
  ];
}
