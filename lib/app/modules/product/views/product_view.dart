import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/appbar/common_appbar.dart';
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
          Get.back();
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
            Obx(
              () => Expanded(
                child: controller.data.isEmpty
                    ? const Center(
                        child: Text("No Data"),
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Number of columns
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio:
                              3 / 4, // Adjust the aspect ratio as needed
                        ),
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) {
                          final iteam = controller.data[index];
                          return InkWell(
                            onTap: () {
                              controller.editClick(iteam);
                            },
                            child: ProductCard(
                              image: Obx(() => Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        controller.data.isNotEmpty
                                            ? Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  border: Border.all(
                                                      color: AppColor
                                                          .boxBorderColor),
                                                ),
                                                child: Image.network(
                                                  errorBuilder: (context,
                                                          exception,
                                                          stackTrack) =>
                                                      Column(
                                                    children: [
                                                      Center(
                                                        child: Icon(
                                                          Icons.error,
                                                          color:
                                                              AppColor.primary,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      const Text(
                                                        'Image not found',
                                                        style: TextStyle(
                                                            fontSize: 10),
                                                      ),
                                                    ],
                                                  ),
                                                  iteam.imageurl ??
                                                      '', // Load from network
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  border: Border.all(
                                                      color: AppColor
                                                          .boxBorderColor),
                                                ),
                                                child: svgWidget(
                                                    SvgAssets.productIcon,
                                                    size: 100), // Placeholder
                                              ),
                                      ])),
                              name: iteam.name ?? '',
                              type: iteam.category ?? '',
                              discription: iteam.description ?? '',
                              price: iteam.price.toString(),
                            ),
                          );
                        }),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primary,
        onPressed: () {
          controller.clear();
          Get.rootDelegate.toNamed(Routes.productAdd);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
