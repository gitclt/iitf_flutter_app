import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/button/common_button.dart';

import '../controllers/version_check_controller.dart';

class VersionCheckView extends GetView<VersionCheckController> {
  const VersionCheckView({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Image.asset(
                "assets/images/main_logo.png",
                width: size.width / 2,
              ),
            ),
            SizedBox(
              height: size.height / 6,
            ),
            headerText("New Version Available"),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: size.width / 3,
              child: CommonButton(
                label: "Update Now",
                onClick: () {
                  controller.checkForUpdate();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Text headerText(String label) {
  return Text(label,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15));
}
