import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/svg_icons/svg_widget.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';
import 'package:iitf_flutter_tab/app/core/assets/image_assets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = Get.width * .47;
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.boxBorderColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: width * .9,
            decoration: const BoxDecoration(color: AppColor.boxBorderColor),
            child: Center(child: svgWidget(SvgAssets.productIcon)),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                boldText('Rope', fontSize: 20),
                SizedBox(
                  height: size.height * 0.01,
                ),
                colorText('Cugfj', 12),
                SizedBox(
                  height: size.height * 0.01,
                ),
                colorText(
                    'Lorem Ipsum has been the industrys standard dummy text ever\n since the 1500s, when an unknown printer took a galley',
                    12),
                SizedBox(
                  height: size.height * 0.01,
                ),
                boldText("250",
                    fontSize: 20,
                    color: AppColor.primary,
                    fontWeight: FontWeight.w700),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
