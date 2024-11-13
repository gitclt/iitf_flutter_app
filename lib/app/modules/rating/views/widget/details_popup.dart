import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/button/add_button.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';
import 'package:iitf_flutter_tab/app/common_widgets/textfeild/add_new_widget.dart';
import 'package:iitf_flutter_tab/app/modules/rating/controllers/rating_controller.dart';

class RatingDetailsPopup extends GetView<RatingController> {
  const RatingDetailsPopup({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      insetPadding: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                boldText('Enter Your Details', fontSize: 22),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
            Wrap(
              spacing: 15,
              runSpacing: 12,
              children: [
                AddTextFieldWidget(
                  label: 'Name',
                  hintText: 'Enter your name',
                  width: size.width * 0.45,
                  textController: controller.nameController,
                ),
                AddTextFieldWidget(
                  label: 'Phone',
                  hintText: 'Enter Phone Number',
                  width: size.width * 0.45,
                  textController: controller.phoneController,
                ),
                AddTextFieldWidget(
                  label: 'State',
                  hintText: 'Enter your State',
                  width: size.width * 0.45,
                  textController: controller.stateController,
                )
              ],
            ),
            AddButton(
                onClick: () {
                  Get.back();
                },
                label: 'Submit')
          ],
        ),
      ),
    );
  }
}
