import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';

class ProductCard extends StatelessWidget {
  final String name, price, discription, type;
  final Widget image;
  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.discription,
    required this.type,
    required this.image,
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
            height: width * .4,
            decoration: const BoxDecoration(color: AppColor.boxBorderColor),
            child: Center(child: image
                // svgWidget(SvgAssets.productIcon)
                ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                boldText(name, fontSize: 20),
                SizedBox(
                  height: size.height * 0.01,
                ),
                colorText(type, 12),
                SizedBox(
                  height: size.height * 0.01,
                ),
                colorText(discription, 12),
                SizedBox(
                  height: size.height * 0.01,
                ),
                boldText(price,
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
