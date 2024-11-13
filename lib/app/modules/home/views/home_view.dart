import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:iitf_flutter_tab/app/common_widgets/appbar/home_appbar.dart';

import 'package:iitf_flutter_tab/app/common_widgets/card/home_card.dart';
import 'package:iitf_flutter_tab/app/common_widgets/container/home_container.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';
import 'package:iitf_flutter_tab/app/constants/orientation_controller.dart';
import 'package:iitf_flutter_tab/app/core/assets/image_assets.dart';
import 'package:iitf_flutter_tab/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        primary: true,
        appBar: HomeAppbar(
          ontap: () {
            Get.rootDelegate.toNamed(Routes.profile);
          },
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Obx(
              () => SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.031,
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
                        const Spacer(),
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
                      ontap: () async {
                        await Get.rootDelegate.toNamed(Routes.preorder);
                        controller.checkHome();
                      },
                      imagepath: SvgAssets.preorderIcon,
                      tittle: 'Pre orders',
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
                      ontap: () async {
                        await Get.rootDelegate.toNamed(Routes.product);
                        controller.checkHome();
                      },
                      imagepath: SvgAssets.productIcon,
                      tittle: 'Products',
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
                    Obx(() => HomeCard(
                          ontap: () async {
                            await Get.rootDelegate.toNamed(Routes.category);
                            controller.checkHome();
                          },
                          imagepath: SvgAssets.categoryIcon,
                          tittle: 'Category',
                          count: controller.categories.length.toString(),
                          color: AppColor.cardColor3,
                        )),
                    SizedBox(
                      height: size.height * 0.035,
                    ),
                    HomeCard(
                      ontap: () async {
                       
                        await Get.rootDelegate.toNamed(Routes.rating);

                        controller.checkHome();
                      },
                      imagepath: SvgAssets.ratingIcon,
                      tittle: 'Rating',
                      count: controller.isLoading.value == true
                          ? ''
                          : controller.data.isNotEmpty
                              ? controller.data.first.ratingCount.toString()
                              : '0',
                      color: AppColor.cardColor4,
                    ),
                  ],
                ),
              ),
            )));
  }
}
