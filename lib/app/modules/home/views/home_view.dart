import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/card/home_card.dart';
import 'package:iitf_flutter_tab/app/common_widgets/container/home_container.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';
import 'package:iitf_flutter_tab/app/core/assets/image_assets.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.035,
              ),
              Row(
                children: [
                  const HomeContainer(
                    icon: SvgAssets.approvedIcon,
                    label: 'Approved Orders:',
                    count: '120',
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  const HomeContainer(
                    label: 'Approved Orders:',
                    count: '525',
                    icon: SvgAssets.orderHomeIcon,
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.035,
              ),
            HomeCard(
                ontap: (){},
                imagepath: SvgAssets.preorderIcon,
                tittle: 'Pre orders',
                subtitle: '+8% from yesterday',
                count: '240',
                color: AppColor.cardColor1,
              ),
              SizedBox(
                height: size.height * 0.035,
              ),
             HomeCard(
               ontap: () {},
                imagepath: SvgAssets.productIcon,
                tittle: 'Products',
                subtitle: '+8% from yesterday',
                count: '20',
                color: AppColor.cardColor2,
              ),
              SizedBox(
                height: size.height * 0.035,
              ),
               HomeCard(
                 ontap: () {},
                imagepath: SvgAssets.ratingIcon,
                tittle: 'Rating',
                subtitle: '+8% from yesterday',
                count: '81',
                color: AppColor.cardColor3,
              ),
            ],
          ),
        ));
  }
}
