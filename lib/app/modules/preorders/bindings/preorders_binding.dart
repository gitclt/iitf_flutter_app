import 'package:get/get.dart';

import '../controllers/preorders_controller.dart';

class PreordersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreordersController>(
      () => PreordersController(),
    );
  }
}
