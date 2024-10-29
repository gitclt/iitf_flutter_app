import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/appbar/common_appbar.dart';
import 'package:iitf_flutter_tab/app/common_widgets/svg_icons/svg_widget.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';
import 'package:iitf_flutter_tab/app/core/assets/image_assets.dart';
import 'package:iitf_flutter_tab/app/routes/app_pages.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});
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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                svgWidget(
                  size: size.height * 0.05,
                  SvgAssets.categoryIcon,
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                const Text(
                  'Product Category',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
                ),
              ],
            ).paddingOnly(
              bottom: 20,
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Number of columns
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 1,

                    childAspectRatio:
                        10 / 4, // Adjust the aspect ratio as needed
                  ),
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      name: controller.data[index].category ?? '',
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primary,
        onPressed: () {
          Get.rootDelegate.toNamed(Routes.categoryAdd);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String name;
  const CategoryCard({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.boxBorderColor, width: 2),
        ),
        child: boldText(name, fontSize: 18),
      ),
    );
  }
}
