import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/appbar/common_appbar.dart';
import 'package:iitf_flutter_tab/app/modules/rating/views/widget/enquiry_view.dart';
import 'package:iitf_flutter_tab/app/modules/rating/views/widget/feedback_view.dart';

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
        body: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),
                  child: TabBar(
                      indicator: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.blue.shade300,
                      tabs: const [
                        Tab(text: 'Feedback'),
                        Tab(text: 'Enquiry'),
                      ]),
                ),
                const Expanded(
                    child:
                        TabBarView(children: [FeedbackView(), EnquiryView()]))
              ],
            ))
        // Padding(
        //   padding: const EdgeInsets.all(15),
        //   child: SingleChildScrollView(
        //     physics: const ScrollPhysics(),
        //     child: Obx(
        //       () => Form(
        //         key: controller.formkey,
        //         child: Column(
        //           children: [
        //             // Column(
        //             //   children: [
        //             Row(
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
        //                   style: TextStyle(
        //                       fontWeight: FontWeight.w500, fontSize: 32),
        //                 ),
        //               ],
        //             ),
        //             SizedBox(
        //               height: size.height * 0.03,
        //             ),
        //             Row(
        //               children: [
        //                 HomeContainer(
        //                   icon: SvgAssets.approvedIcon,
        //                   label: 'Department : ',
        //                   count: LocalStorageKey.department,
        //                 ),
        //                 SizedBox(
        //                   width: size.width * 0.02,
        //                 ),
        //                 HomeContainer(
        //                   label: 'Stall :',
        //                   count: LocalStorageKey.stallName,
        //                   icon: SvgAssets.orderHomeIcon,
        //                 ),
        //               ],
        //             ),
        //             SizedBox(
        //               height: size.height * 0.02,
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 LoginTextFeild(
        //                   textController: controller.nameController,
        //                   width: size.width * 0.45,
        //                   label: 'Customer',
        //                 ),
        //                 LoginTextFeild(
        //                   textController: controller.phoneController,
        //                   width: size.width * 0.45,
        //                   label: 'Phone',
        //                   keyboard: TextInputType.number,
        //                   inputFormat: true,
        //                   maxLengthLimit: 10,
        //                 ),
        //               ],
        //             ),
        //             SizedBox(
        //               height: size.height * 0.02,
        //             ),
        //             const Text(
        //               'Rate us Now',
        //               style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
        //             ),
        //             SizedBox(
        //               height: size.height * 0.01,
        //             ),
        //             // Adding the 5-star rating widget
        //             RatingBar.builder(
        //               initialRating:
        //                   double.tryParse(controller.rating.value) ?? 0.0,
        //               minRating: 1,
        //               direction: Axis.horizontal,
        //               allowHalfRating: true,
        //               itemCount: 5,
        //               itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        //               itemBuilder: (context, _) => Icon(
        //                 Icons.star,
        //                 color: AppColor.primary,
        //               ),
        //               onRatingUpdate: (rating) {
        //                 controller.rating.value = rating.toString();
        //               },
        //             ),
        //             SizedBox(
        //               height: size.height * 0.02,
        //             ),
        //             TextFormField(
        //               controller: controller.descriptionController,

        //               decoration: InputDecoration(
        //                 hintText: 'Write your experience',
        //                 border: OutlineInputBorder(
        //                   borderRadius: BorderRadius.circular(4),
        //                   borderSide: const BorderSide(
        //                     color: Color(0xFFDDDDDD),
        //                     width: 1,
        //                   ),
        //                 ),
        //                 enabledBorder: OutlineInputBorder(
        //                   borderRadius: BorderRadius.circular(4),
        //                   borderSide: const BorderSide(
        //                     color: Color(0xFFDDDDDD),
        //                     width: 1,
        //                   ),
        //                 ),
        //               ),
        //               maxLines: 5, // Sets the maximum number of lines
        //               minLines: 5,
        //             ),
        //             SizedBox(
        //               height: size.height * 0.02,
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 AddButton(
        //                   isLoading: controller.isLoading.value,
        //                   width: size.width * 0.3,
        //                   onClick: () {
        //                     if (controller.rating.value.isEmpty ||
        //                         double.parse(controller.rating.value) == 0.0) {
        //                       Utils.snackBar('Rating Required',
        //                           'Please provide a rating before submitting.');
        //                     } else if (controller.formkey.currentState!
        //                         .validate()) {
        //                       FocusScope.of(context).requestFocus(FocusNode());
        //                       controller.add();
        //                     }
        //                     // Validate and submit the form if needed
        //                   },
        //                   label: 'SUBMIT',
        //                 ),
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        //   //   ],
        //   // ),
        // ),
        );
  }
}
