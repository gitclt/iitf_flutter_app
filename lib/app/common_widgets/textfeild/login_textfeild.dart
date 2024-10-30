import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';

class LoginTextFeild extends StatelessWidget {
  final String label;
  final double width;
  final TextEditingController? textController;
  const LoginTextFeild({
    super.key,
    // required this.controller,
    required this.label,
    this.textController, required this.width,
  });

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return SizedBox(
      width: width,
      child: TextFormField(
        
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter $label';
          }
          return null;
        },
        controller: textController,
        decoration: InputDecoration(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: const TextStyle(color: Colors.black),
              ),
              Text(
                "*",
                style: TextStyle(color: AppColor.primary),
              ).paddingOnly(left: 3),
            ],
          ),
          hintText: 'Enter $label',
          floatingLabelBehavior: FloatingLabelBehavior.always,
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
      ),
    );
  }
}
