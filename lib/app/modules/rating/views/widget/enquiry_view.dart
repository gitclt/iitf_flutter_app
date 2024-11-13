import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/button/add_button.dart';
import 'package:iitf_flutter_tab/app/common_widgets/drop_down/drop_down3_widget.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';
import 'package:iitf_flutter_tab/app/common_widgets/textfeild/add_new_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';

import '../../../../data/model/enquiry/add_enquiry_model.dart';
import '../../controllers/rating_controller.dart';

class EnquiryView extends GetView<RatingController> {
  const EnquiryView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final width = size.width * 0.46;
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
            key: controller.formkey1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter Your Details',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AddTextFieldWidget(
                      textController: controller.enqNameController,
                      hintText: 'Enter Name',
                      width: width,
                      label: 'Name',
                      visible: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Name';
                        }
                        return null;
                      },
                    ),
                    AddTextFieldWidget(
                      textController: controller.enqPhoneController,
                      hintText: 'Phone',
                      width: width,
                      label: 'Phone',
                      visible: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter phone';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AddTextFieldWidget(
                      textController: controller.enqEmailController,
                      hintText: 'Enter Email',
                      width: width,
                      label: 'Email',
                      visible: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Email';
                        }
                        return null;
                      },
                    ),
                    DropDown3Widget(
                      width: width,
                      label: 'Select State',
                      hint: '--Select State--',
                      selectedItem: controller.selectedState,

                      items: controller.states,
                      // onChanged: (data) async {
                      //   if (data == null) return;
                      //   controller.sdCat = data;
                      // },
                      onChanged: (data) => controller.onStateSelected(data),
                      validator: (value) {
                        if (value == null) {
                          return 'Select state';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                boldText('Product Category', fontSize: 18),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: controller.homeController.categories.map((product) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Obx(() {
                          return Checkbox(
                            value: product.isSelect!.value,
                            onChanged: (bool? value) {
                              product.isSelect!.value = value ?? false;
                            },
                            activeColor: AppColor.primary,
                          );
                        }),
                        Text(
                          product.category ?? '',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.96,
                      child: TextFormField(
                        controller: controller.enquiryController,

                        decoration: InputDecoration(
                          hintText: 'Enquiry',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: AppColor.textGrayColor,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                                color: AppColor.textGrayColor, width: 0.5),
                          ),
                        ),
                        maxLines: 3, // Sets the maximum number of lines
                        minLines: 3,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AddButton(
                      //   isLoading: controller.isLoading.value,
                      width: size.width * 0.96,
                      height: size.height * 0.1,
                      onClick: () {
                        if (controller.formkey1.currentState!.validate()) {
                          controller.homeController.addToEnq(EnqAddModel(
                              name: controller.enqNameController.text,
                              email: controller.enquiryController.text,
                              mobile: controller.enqPhoneController.text,
                              state: controller.selectedState!.id.toString(),
                              catIds: '1',
                              enquiry: controller.enquiryController.text));
                        }
                      },
                      label: 'SUBMIT',
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
