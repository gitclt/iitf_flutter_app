import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/appbar/common_appbar.dart';
import 'package:iitf_flutter_tab/app/common_widgets/button/add_button.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';
import 'package:iitf_flutter_tab/app/common_widgets/textfeild/add_new_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';
import 'package:iitf_flutter_tab/app/modules/category/controllers/category_controller.dart';

class CategoryAdd extends GetView<CategoryController> {
  const CategoryAdd({super.key});

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
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              boldText("Add Product Category", fontSize: 32),
              const SizedBox(
                height: 25,
              ),
              Form(
                key: controller.formkey,
                child: AddTextFieldWidget(
                  hintText: 'Enter Name',
                  label: 'Category Name',
                  textController: controller.nameController,
                  visible: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Name';
                    }
                    return null;
                  },
                ),
              ),
              controller.editId == ''
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AddButton(
                          onClick: () {
                            if (controller.formkey.currentState!.validate()) {
                              // if (controller.editId == '') {
                              controller.add();
                              // } else {
                              // controller.edit();
                              // }
                            }
                          },
                          label: 'Add Category',
                          width: size.width * 0.2,
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AddButton(
                          bgColor: AppColor.green,
                          onClick: () {
                            if (controller.formkey.currentState!.validate()) {
                              controller.edit();
                            }
                          },
                          label: 'Edit Category',
                          width: size.width * 0.2,
                        ),
                        SizedBox(
                          width: size.width * 0.1,
                        ),
                        AddButton(
                          bgColor: AppColor.red,
                          onClick: () {
                            if (controller.formkey.currentState!.validate()) {
                              controller.delete();
                            }
                          },
                          label: 'Delete Category',
                          width: size.width * 0.2,
                        ),
                      ],
                    )
            ])));
  }
}
