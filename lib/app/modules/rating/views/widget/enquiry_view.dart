import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/button/add_button.dart';
import 'package:iitf_flutter_tab/app/common_widgets/drop_down/drop_down3_widget.dart';
import 'package:iitf_flutter_tab/app/common_widgets/textfeild/add_new_widget.dart';


import '../../controllers/rating_controller.dart';

class EnquiryView extends GetView<RatingController> {
  const EnquiryView({super.key});

  @override
  Widget build(BuildContext context) {
      var size = MediaQuery.of(context).size;
       final width = size.width * 0.46;
    return Form(child:
    Column(
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
              // textController: controller.nameController,
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
              // textController: controller.nameController,
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
              // textController: controller.nameController,
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
              selectedItem:
                  controller.selectedState == null ? null :  controller.selectedState,
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
        Row(children: [
              TextFormField(
            //   controller: controller.descriptionController,

              decoration: InputDecoration(
                hintText: 'Enquiry',
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
              maxLines: 3, // Sets the maximum number of lines
              minLines: 3,
            ),
        ],),
           SizedBox(
          height: size.height * 0.02,
        ),
           Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AddButton(
            //   isLoading: controller.isLoading.value,
              width: size.width * 0.3,
              onClick: () {
               
               
              },
              label: 'SUBMIT',
            ),
          ],
        )
    ],) 
    );
  }
}