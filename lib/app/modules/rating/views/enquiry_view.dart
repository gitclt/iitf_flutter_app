import 'package:flutter/material.dart';
import 'package:iitf_flutter_tab/app/common_widgets/button/add_button.dart';
import 'package:iitf_flutter_tab/app/common_widgets/textfeild/login_textfeild.dart';

class EnquiryView extends StatelessWidget {
  const EnquiryView({super.key});

  @override
  Widget build(BuildContext context) {
      var size = MediaQuery.of(context).size;
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
            LoginTextFeild(
            //   textController: controller.nameController,
              width: size.width * 0.45,
              label: 'Name',
            ),
            LoginTextFeild(
            //   textController: controller.phoneController,
              width: size.width * 0.45,
              label: 'Phone',
              keyboard: TextInputType.number,
              inputFormat: true,
              maxLengthLimit: 10,
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
            //   textController: controller.nameController,
              width: size.width * 0.45,
              label: 'Location',
            ),
            LoginTextFeild(
            //   textController: controller.phoneController,
              width: size.width * 0.45,
              label: 'Product category',
              keyboard: TextInputType.number,
              inputFormat: true,
              maxLengthLimit: 10,
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
                hintText: 'Remark',
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