import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/svg_icons/svg_widget.dart';
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
                  ),
                  SizedBox(
                    width: size.width * 0.15,
                  ),
                  const HomeContainer(
                    icon: SvgAssets.orderHomeIcon,
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.035,
              ),
              const HomeCard(
                imagepath: SvgAssets.preorderIcon,
                tittle: '',
                subtitle: '',
                count: '',
                color: AppColor.cardColor1,
              ),
              SizedBox(
                height: size.height * 0.035,
              ),
              const HomeCard(
                imagepath: SvgAssets.productIcon,
                tittle: '',
                subtitle: '',
                count: '',
                color: AppColor.cardColor2,
              ),
              SizedBox(
                height: size.height * 0.035,
              ),
              const HomeCard(
                imagepath: SvgAssets.ratingIcon,
                tittle: '',
                subtitle: '',
                count: '',
                color: AppColor.cardColor3,
              ),
            ],
          ),
        ));
  }
}

class HomeCard extends StatelessWidget {
  final String imagepath;
  final String tittle;
  final String subtitle;
  final String count;
  final Color color;
  const HomeCard({
    super.key,
    required this.imagepath,
    required this.tittle,
    required this.subtitle,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: color),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            svgWidget(imagepath),
            Column(
              children: [Text(tittle), Text(subtitle)],
            ),
            const Spacer(),
            Text(count)
          ],
        ).paddingAll(5),
      ),
    );
  }
}

class HomeContainer extends StatelessWidget {
  final String icon;

  const HomeContainer({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 80, left: 12, bottom: 12, top: 12),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0x0F000000), // #0000000F in ARGB format
              offset: Offset(0, 0),
              blurRadius: 12,
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(20),
          color: AppColor.white,
          border: Border.all(color: AppColor.boxBorderColor)),
      child: Row(
        children: [svgWidget(icon), const Text('Approved Orders : 120')],
      ),
    );
  }
}
