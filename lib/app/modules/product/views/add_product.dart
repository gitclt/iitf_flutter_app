import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/appbar/common_appbar.dart';
import 'package:iitf_flutter_tab/app/common_widgets/button/common_button.dart';
import 'package:iitf_flutter_tab/app/common_widgets/drop_down/drop_down3_widget.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';
import 'package:iitf_flutter_tab/app/common_widgets/textfeild/add_new_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';

import '../controllers/product_controller.dart';

class ProductAdd extends GetView<ProductController> {
  const ProductAdd({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final width = size.width * 0.45;
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      appBar: CommonAppBar(
        ontap: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          // key: controller.formkey,
          child: Wrap(
            spacing: 20,
            runSpacing: 0,
            children: [
              Row(
                children: [
                  boldText("Add Product", fontSize: 32),
                ],
              ).paddingOnly(bottom: 20),
              DropDown3Widget(
                width: width,
                label: 'Product Category',
                hint: '--Select Product Category--',
                selectedItem: controller.sdCat,
                items: controller.catDropList,
                onChanged: (data) async {
                  if (data == null) return;
                  controller.sdCat = data;
                },
                validator: (value) {
                  if (value == null) {
                    return 'Select Product Category';
                  }
                  return null;
                },
              ),
              AddTextFieldWidget(
                width: width,
                label: 'Product Name',
                visible: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Product Name';
                  }
                  return null;
                },
              ),
              AddTextFieldWidget(
                width: width,
                label: 'code',
                visible: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter code';
                  }
                  return null;
                },
              ),
              AddTextFieldWidget(
                width: width,
                label: 'Image',
                visible: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Image';
                  }
                  return null;
                },
              ),
              AddTextFieldWidget(
                width: width,
                label: 'Price',
                visible: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Price';
                  }
                  return null;
                },
              ),
              AddTextFieldWidget(
                width: width,
                label: 'Offer Price',
                visible: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Offer Price';
                  }
                  return null;
                },
              ),
              AddTextFieldWidget(
                width: width,
                label: 'Stall Email',
                visible: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Email';
                  }
                  return null;
                },
              ),
              SizedBox(
                width: width,
                height: size.height * 0.075,
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: AppColor.primary,
                      value: controller.isVisible.value,
                      onChanged: (value) {
                        // controller.launchCheckbox();
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text('Visibility')
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonButton(
                    label: "ADD PRODUCT",
                    onClick: () {},
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Form(
//       key: controller.formkey,
//       child: Wrap(
//         spacing: 50,
//         runSpacing: 20,
//         children: [
//           DropDown3Widget(
//             label: 'Product Category',
//             hint: '--Select Product Category--',
//             selectedItem:
//                 // controller.sCat.id == null ? null :
//                 controller.sdCat,
//             items: controller.catDropList,
//             onChanged: (data) async {
//               if (data == null) return;
//               controller.sdCat = data;
//             },
//             validator: (value) {
//               if (value == null) {
//                 return 'Select Product Category';
//               }
//               return null;
//             },
//           ),

//           AddTextFieldWidget(
//             // textController: controller.artnoController,
//             label: 'Product Name',
//             visible: true,
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Product Name';
//               }
//               return null;
//             },
//           ),

//           AddTextFieldWidget(
//             // textController: controller.nameController,
//             label: 'code',
//             visible: true,
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Enter code';
//               }
//               return null;
//             },
//           ),
//           AddTextFieldWidget(
//             // textController: controller.artnoController,
//             label: 'Image',
//             visible: true,
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Image';
//               }
//               return null;
//             },
//           ),
//           AddTextFieldWidget(
//             // textController: controller.nameController,
//             label: 'Price',
//             visible: true,
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Enter Price';
//               }
//               return null;
//             },
//           ),
//           AddTextFieldWidget(
//             // textController: controller.nameController,
//             label: 'Offer Price',
//             visible: true,
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Enter Offer Price';
//               }
//               return null;
//             },
//           ),

//           AddTextFieldWidget(
//             // textController: controller.nameController,
//             label: 'Stall Email',
//             visible: true,
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Enter Email';
//               }
//               return null;
//             },
//           ),
//           // Obx(() => 
//           SizedBox(
//                 width: size.width * .8,
//                 height: size.height * 0.075,
//                 child: Row(
//                   children: [
//                     Checkbox(
//                       activeColor: AppColor.primary,
//                       value: controller.isVisible.value,
//                       onChanged: (value) {
//                         // controller.launchCheckbox();
//                       },
//                     ),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     const Text('Visibility')
//                   ],
//                 ),
//               // )
//               ),
//           SizedBox(
//             height: size.height * 0.03,
//           ),
//           // Row(
//           //   crossAxisAlignment: CrossAxisAlignment.end,
//           //   mainAxisAlignment: MainAxisAlignment.end,
//           //   children: [
//           //     CommonButton(
//           //       isLoading: controller.isLoading.value,
//           //       width: Responsive.isDesktop(context)
//           //           ? size.width * .1
//           //           : size.width * 0.25,
//           //       onClick: () {
//           //         if (controller.formkey.currentState!.validate()) {
//           //           if (controller.editId == '') {
//           //             controller.addProduct();
//           //           } else {
//           //             controller.editProduct();
//           //           }
//           //         }
//           //       },
//           //       label: controller.editId == '' ? 'Next' : 'Update',
//           //     ),
//           //   ],
//           // ),
//         ],
//       ),
//     );
//   }
// }
