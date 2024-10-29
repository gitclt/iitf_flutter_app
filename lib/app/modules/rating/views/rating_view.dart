// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:iitf_flutter_tab/app/common_widgets/appbar/home_appbar.dart';
// import 'package:iitf_flutter_tab/app/common_widgets/button/common_button.dart';
// import 'package:iitf_flutter_tab/app/common_widgets/container/home_container.dart';
// import 'package:iitf_flutter_tab/app/common_widgets/svg_icons/svg_widget.dart';
// import 'package:iitf_flutter_tab/app/common_widgets/textfeild/login_textfeild.dart';
// import 'package:iitf_flutter_tab/app/core/assets/image_assets.dart';
// import 'package:iitf_flutter_tab/app/routes/app_pages.dart';

// import '../controllers/rating_controller.dart';

// class RatingView extends GetView<RatingController> {
//   const RatingView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: CommonAppBar(
//         ontap: () {
//           Get.rootDelegate.toNamed(Routes.profile);
//         },
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           children: [
//             Column(
//               children: [
//                 svgWidget(
//                   size: size.height * 0.05,
//                   SvgAssets.ratingIcon,
//                 ),
//                 SizedBox(
//                   width: size.width * 0.01,
//                 ),
//                 const Text(
//                   'Rating',
//                   style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
//                 ),
//                 Row(
//                   children: [
//                     const HomeContainer(
//                       icon: SvgAssets.approvedIcon,
//                       label: 'Department : ',
//                       count: 'Agriculture',
//                     ),
//                     SizedBox(
//                       width: size.width * 0.02,
//                     ),
//                     const HomeContainer(
//                       label: 'Stall ',
//                       count: ': Stall 01',
//                       icon: SvgAssets.orderHomeIcon,
//                     )
//                   ],
//                 ),
//                 LoginTextFeild(
//                   //  textController: controller.passwordController.value,
//                   label: 'Customer',
//                 ),
//                 LoginTextFeild(
//                   //  textController: controller.passwordController.value,
//                   label: 'Phone',
//                 ),
//                 const Text(
//                   'Rate us Now',
//                   style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
//                 ),
//                 CommonButton(
//                   // isLoading: controller.isLoading.value,
//                   onClick: () {
//                     // if (controller.formkey1.currentState!.validate()) {

//                     // }
//                   },
//                   label: 'Submit'.tr,
//                 ).paddingSymmetric(horizontal: 200, vertical: 15),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/appbar/common_appbar.dart';
import 'package:iitf_flutter_tab/app/common_widgets/button/add_button.dart';
import 'package:iitf_flutter_tab/app/common_widgets/button/common_button.dart';
import 'package:iitf_flutter_tab/app/common_widgets/container/home_container.dart';
import 'package:iitf_flutter_tab/app/common_widgets/svg_icons/svg_widget.dart';
import 'package:iitf_flutter_tab/app/common_widgets/textfeild/login_textfeild.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';
import 'package:iitf_flutter_tab/app/core/assets/image_assets.dart';

import '../controllers/rating_controller.dart';

class RatingView extends GetView<RatingController> {
  const RatingView({super.key});

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
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              // Column(
              //   children: [
              Row(
                children: [
                  svgWidget(
                    size: size.height * 0.05,
                    SvgAssets.ratingIcon,
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  const Text(
                    'Rating',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                children: [
                  const HomeContainer(
                    icon: SvgAssets.approvedIcon,
                    label: 'Department : ',
                    count: 'Agriculture',
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  const HomeContainer(
                    label: 'Stall ',
                    count: ': Stall 01',
                    icon: SvgAssets.orderHomeIcon,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LoginTextFeild(
                    width: size.width * 0.45,
                    label: 'Customer',
                  ),
                  LoginTextFeild(
                    width: size.width * 0.45,
                    label: 'Phone',
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Text(
                'Rate us Now',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              // Adding the 5-star rating widget
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: AppColor.primary,
                ),
                onRatingUpdate: (rating) {
                  // Handle rating changes if needed, e.g., update controller
                  //  controller.updateRating(rating);
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Write your experience',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: Color(0xFFDDDDDD),
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: Color(0xFFDDDDDD),
                      width: 1,
                    ),
                  ),
                ),
                maxLines: 5, // Sets the maximum number of lines
                minLines: 5,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AddButton(
                    width: size.width * 0.3,
                    onClick: () {
                      // Validate and submit the form if needed
                    },
                    label: 'SUBMIT',
                  ),
                ],
              )
            ],
          ),
        ),
        //   ],
        // ),
      ),
    );
  }
}
