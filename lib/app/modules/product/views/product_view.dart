import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/appbar/home_appbar.dart';
import 'package:iitf_flutter_tab/app/common_widgets/card/product_card.dart';
import 'package:iitf_flutter_tab/app/common_widgets/svg_icons/svg_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';
import 'package:iitf_flutter_tab/app/core/assets/image_assets.dart';
import 'package:iitf_flutter_tab/app/routes/app_pages.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});
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
                  SvgAssets.productIcon,
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                const Text(
                  'Product',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            const Wrap(
              children: [
                ProductCard(),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primary,
        onPressed: () {
          Get.rootDelegate.toNamed(Routes.productAdd);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
