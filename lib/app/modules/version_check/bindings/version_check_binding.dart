import 'package:get/get.dart';

import '../controllers/version_check_controller.dart';

class VersionCheckBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VersionCheckController>(
      () => VersionCheckController(),
    );
  }
}
