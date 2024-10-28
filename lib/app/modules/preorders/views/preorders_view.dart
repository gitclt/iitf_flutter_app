import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/appbar/home_appbar.dart';
import 'package:iitf_flutter_tab/app/common_widgets/button/approve_button.dart';
import 'package:iitf_flutter_tab/app/common_widgets/container/order_container.dart';
import 'package:iitf_flutter_tab/app/common_widgets/svg_icons/svg_widget.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';
import 'package:iitf_flutter_tab/app/core/assets/image_assets.dart';
import 'package:iitf_flutter_tab/app/modules/preorders/views/widget/approve_tab.dart';
import 'package:iitf_flutter_tab/app/modules/preorders/views/widget/pending_tab.dart';
import 'package:iitf_flutter_tab/app/modules/preorders/views/widget/reject_tab.dart';
import 'package:iitf_flutter_tab/app/routes/app_pages.dart';

import '../controllers/preorders_controller.dart';

class PreordersView extends GetView<PreordersController> {
  const PreordersView({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CommonAppBar(
        ontap: () {
          Get.rootDelegate.toNamed(Routes.profile);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                svgWidget(
                  size: size.height * 0.05,
                  SvgAssets.preorderIcon,
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                const Text(
                  'Pre Orders',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
                ),
              ],
            ),
            TabBar(
              controller: controller.tabcontroller,
              tabs: const [
                Tab(text: "Pending Order"),
                Tab(text: "Approved Order"),
                Tab(text: "Rejected Order"),
              ],
              indicatorColor: AppColor.primary,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabcontroller,
                children: const [PendingTab(), ApproveTab(), RejectTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
