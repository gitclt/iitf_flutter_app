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
      body: Wrap(
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
          ),
          const CategoryCard(),
          CategoryCard(),
          CategoryCard(),
        ],
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
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.boxBorderColor, width: 2),
        ),
        child: boldText('Category 01'),
      ),
    );
  }
}
