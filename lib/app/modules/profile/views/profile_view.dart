import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/appbar/home_appbar.dart';
import 'package:iitf_flutter_tab/app/common_widgets/button/common_button.dart';
import 'package:iitf_flutter_tab/app/common_widgets/svg_icons/svg_widget.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';
import 'package:iitf_flutter_tab/app/core/assets/image_assets.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    const height = SizedBox(
      height: 20,
    );
    const width = SizedBox(
      width: 200,
    );
    return Scaffold(
        appBar: CommonAppBar(
          ontap: () {},
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boldText("Profile", fontSize: 32),
              height,
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: AppColor.boxBorderColor)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      svgWidget(SvgAssets.personIcon),
                      const SizedBox(
                        width: 15,
                      ),
                      colorText('Stall1', 20),
                      const Spacer(),
                      const Icon(Icons.edit)
                    ],
                  ),
                ),
              ),
              height,
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileText(
                        tittle: 'Shop Name',
                        subtitle: 'ABC Shop',
                      ),
                      ProfileText(
                        tittle: 'Phone',
                        subtitle: '1234567890',
                      ),
                      ProfileText(
                        tittle: 'WebSite Address',
                        subtitle: 'ABC.com',
                      ),
                    ],
                  ),
                  width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileText(
                        tittle: 'Address',
                        subtitle: 'ABC Kerala,India',
                      ),
                      ProfileText(
                        tittle: 'Department',
                        subtitle: 'Agriculture',
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonButton(
                    label: 'LOGOUT',
                    onClick: () {},
                  )
                ],
              )
            ],
          ),
        ));
  }
}

class ProfileText extends StatelessWidget {
  final String tittle;
  final String subtitle;
  const ProfileText({
    super.key,
    required this.tittle,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        colorText(tittle, 16),
        const SizedBox(
          height: 8,
        ),
        boldText(subtitle, fontSize: 18)
      ],
    ).paddingOnly(bottom: 20);
  }
}
