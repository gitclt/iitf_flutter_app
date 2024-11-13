import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/button/add_button.dart';
import 'package:iitf_flutter_tab/app/common_widgets/drop_down/drop_down3_widget.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';
import 'package:iitf_flutter_tab/app/common_widgets/textfeild/add_new_widget.dart';
import 'package:iitf_flutter_tab/app/constants/strings.dart';
import 'package:iitf_flutter_tab/app/data/model/rating/rating_add_model.dart';
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
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
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
              const SizedBox(
                height: 12,
              ),
              Wrap(
                spacing: 15,
                runSpacing: 12,
                children: [
                  AddTextFieldWidget(
                    label: 'Name',
                    hintText: 'Enter your Name',
                    width: size.width * 0.45,
                    textController: controller.nameController,
                  ),
                  AddTextFieldWidget(
                    label: 'Phone',
                    hintText: 'Enter Phone Number',
                    width: size.width * 0.45,
                    textController: controller.phoneController,
                  ),
                  DropDown3Widget(
                    //  width: width,
                    label: 'Select State',
                    hint: '--Select State--',
                    selectedItem: controller.detailSelectedState,

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
              const SizedBox(
                height: 20,
              ),
              AddButton(
                  height: size.height * 0.08,
                  onClick: () {
                    controller.homeController.addToRating(RatingAddModel(
                        stallId: int.parse(LocalStorageKey.stallId),
                        name: controller.nameController.text,
                        mobile: controller.phoneController.text,
                        description: controller.descriptionController.text,
                        state: controller.detailSelectedState.toString(),
                        overallExperience: controller.rating1.value,
                        productOfferDisplay: controller.rating2.value,
                        date: DateTime.now()));
                    Get.back();
                  },
                  label: 'Submit')
            ],
          ),
        ),
      ),
    );
  }
}
