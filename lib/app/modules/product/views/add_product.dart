import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/appbar/common_appbar.dart';
import 'package:iitf_flutter_tab/app/common_widgets/button/add_button.dart';
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
    final width = size.width * 0.46;
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
          key: controller.formkey,
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
                selectedItem:
                    controller.sdCat.id == null ? null : controller.sdCat,
                items: controller.categoryDropList,
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
                textController: controller.nameController,
                hintText: 'Enter Name',
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
                textController: controller.codeController,
                width: width,
                hintText: 'Enter Code',
                label: 'code',
                visible: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter code';
                  }
                  return null;
                },
              ),
              Obx(() => AddTextFieldWidget(
                    suffixIcon: const Icon(Icons.upload),
                    onTap: () {
                      controller.pickImage();
                    },
                    readonly: true,
                    hintText: controller.imageName.value.isNotEmpty
                        ? controller.imageName.value
                        : 'Image',
                    width: width,
                    label: 'Image',
                    visible: true,
                  )),
              AddTextFieldWidget(
                textController: controller.priceController,
                hintText: 'Enter Price',
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
                textController: controller.offerController,
                hintText: "Enter Offer Price",
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
              Row(
                children: [
                  AddTextFieldWidget(
                    width: size.width * .95,
                    textController: controller.descriptionController,
                    maxLengthLimit: 5,
                    minLines: 5,
                    hintText: "Enter Description",
                    label: ' Description',
                    visible: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Description';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AddButton(
                    width: size.width * 0.3,
                    label: "ADD PRODUCT",
                    onClick: () {
                      if (controller.formkey.currentState!.validate()) {
                        controller.add();
                      }
                    },
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
