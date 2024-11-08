import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/appbar/common_appbar.dart';
import 'package:iitf_flutter_tab/app/common_widgets/button/add_button.dart';
import 'package:iitf_flutter_tab/app/common_widgets/svg_icons/svg_widget.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';
import 'package:iitf_flutter_tab/app/constants/strings.dart';
import 'package:iitf_flutter_tab/app/core/assets/image_assets.dart';
import 'package:iitf_flutter_tab/app/data/local/user_preference/user_prefrence_view_model.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const height = SizedBox(
      height: 20,
    );
    // const width = SizedBox(
    //   width: 200,
    // );
    return Scaffold(
        appBar: CommonAppBar(
          ontap: () {
            Get.back();
          },
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
                      svgWidget(SvgAssets.appbarIcon),
                      const SizedBox(
                        width: 15,
                      ),
                      colorText(LocalStorageKey.stallName, size.width * 0.025,
                          color: AppColor.black, fontWeight: FontWeight.bold),
                      const Spacer(),
                      // const Icon(Icons.edit)
                    ],
                  ),
                ),
              ),
              height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileText(
                        tittle: 'Shop Name',
                        subtitle: LocalStorageKey.userName,
                      ),
                      ProfileText(
                        tittle: 'Phone',
                        subtitle: LocalStorageKey.phone,
                      ),
                      ProfileText(
                        tittle: 'WebSite Address',
                        subtitle: LocalStorageKey.websiteAddress,
                      ),
                    ],
                  ),
                  // width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileText(
                        tittle: 'Address',
                        subtitle: LocalStorageKey.address,
                      ),
                      ProfileText(
                        tittle: 'Department',
                        subtitle: LocalStorageKey.department,
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AddButton(
                    width: size.width * 0.3,
                    label: 'LOGOUT',
                    onClick: () {
                      UserPreference().removeUser();
                      UserPreference().goToSplash();
                    },
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
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: boldText(subtitle, fontSize: 18))
      ],
    ).paddingOnly(bottom: 20);
  }
}
