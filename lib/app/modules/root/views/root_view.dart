import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';
import 'package:iitf_flutter_tab/app/core/assets/image_assets.dart';

import '../../../routes/app_pages.dart';
import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        return Scaffold(
          backgroundColor: AppColor.primary,
          body: Obx(
            () => (!controller.isLoading)
                ? (controller.isAuthenticated)
                    ? GetRouterOutlet(
                        initialRoute: Routes.home,
                      )
                    : GetRouterOutlet(
                        initialRoute: Routes.login,
                      )
                : _buildSplash(context),
          ),
        );
      },
    );
  }

  Widget _buildSplash(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          // height: 150,
          // width: 150,
          child: Image.asset(
            ImageAssets.splashScreen,
          ),
        ),
      ],
    ));
  }
}
