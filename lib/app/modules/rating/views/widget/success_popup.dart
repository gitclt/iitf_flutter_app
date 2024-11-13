import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';

class SuccessPopup extends StatelessWidget {
  const SuccessPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      insetPadding: const EdgeInsets.all(20),
      child: SizedBox(
        width: 200,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close)),
                ],
              ),
              Image.asset('assets/images/Rating.png'),
              const SizedBox(
                height: 30,
              ),
              xtraBoldText('Thank You', 40, color: AppColor.primary),
              const SizedBox(
                height: 15,
              ),
              boldText('Thank You for your Valuable Feedback', fontSize: 15)
            ],
          ),
        ),
      ),
    );
  }
}
