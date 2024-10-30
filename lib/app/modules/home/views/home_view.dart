import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/appbar/home_appbar.dart';

import 'package:iitf_flutter_tab/app/common_widgets/card/home_card.dart';
import 'package:iitf_flutter_tab/app/common_widgets/container/home_container.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';
import 'package:iitf_flutter_tab/app/core/assets/image_assets.dart';
import 'package:iitf_flutter_tab/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: HomeAppbar(
          ontap: () {
            Get.rootDelegate.toNamed(Routes.profile);
          },
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Obx(
              () => Column(
                children: [
                  SizedBox(
                    height: size.height * 0.035,
                  ),
                  Row(
                    children: [
                      HomeContainer(
                          icon: SvgAssets.approvedIcon,
                          label: 'Approved Orders:',
                          count: controller.isLoading.value == true
                              ? ''
                              : controller.data.isNotEmpty
                                  ? controller.data.first.approvedOrderCount
                                      .toString()
                                  : '0'),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      HomeContainer(
                        label: 'Order Value :',
                        count: controller.isLoading.value == true
                            ? ''
                            : controller.data.isNotEmpty
                                ? controller.data.first.orderValue.toString()
                                : '0',
                        icon: SvgAssets.orderHomeIcon,
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.035,
                  ),
                  HomeCard(
                    ontap: () {
                      Get.rootDelegate.toNamed(Routes.preorder);
                    },
                    imagepath: SvgAssets.preorderIcon,
                    tittle: 'Pre orders',
                    subtitle: '+8% from yesterday',
                    count: controller.isLoading.value == true
                        ? ''
                        : controller.data.isNotEmpty
                            ? controller.data.first.orderCount.toString()
                            : '0',
                    color: AppColor.cardColor1,
                  ),
                  SizedBox(
                    height: size.height * 0.035,
                  ),
                  HomeCard(
                    ontap: () {
                      Get.rootDelegate.toNamed(Routes.product);
                    },
                    imagepath: SvgAssets.productIcon,
                    tittle: 'Products',
                    subtitle: '+8% from yesterday',
                    count: controller.isLoading.value == true
                        ? ''
                        : controller.data.isNotEmpty
                            ? controller.data.first.productCount.toString()
                            : '0',
                    color: AppColor.cardColor2,
                  ),
                  SizedBox(
                    height: size.height * 0.035,
                  ),
                  HomeCard(
                    ontap: () {
                      Get.rootDelegate.toNamed(Routes.category);
                    },
                    imagepath: SvgAssets.categoryIcon,
                    tittle: 'Category',
                    subtitle: '+8% from yesterday',
                    count: controller.isLoading.value == true
                        ? ''
                        : controller.data.isNotEmpty
                            ? controller.data.first.categoryCount.toString()
                            : '0',
                    color: AppColor.cardColor3,
                  ),
                  SizedBox(
                    height: size.height * 0.035,
                  ),
                  HomeCard(
                    ontap: () {
                      Get.rootDelegate.toNamed(Routes.rating);
                    },
                    imagepath: SvgAssets.ratingIcon,
                    tittle: 'Rating',
                    subtitle: '+8% from yesterday',
                    count: controller.isLoading.value == true
                        ? ''
                        : controller.data.isNotEmpty
                            ? controller.data.first.stallCount.toString()
                            : '0',
                    color: AppColor.cardColor4,
                  ),
                ],
              ),
            )));
  }
}
