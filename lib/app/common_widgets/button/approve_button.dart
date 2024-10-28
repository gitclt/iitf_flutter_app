import 'package:flutter/material.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';

class ApproveButton extends StatelessWidget {
  final String label;
  const ApproveButton({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // height: 36,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: label == 'APPROVE' ? const Color(0xff30BE41) : const Color(0xffFF0606)),
      child: Row(
        children: [
          Icon(
            label == 'APPROVE' ? Icons.check_circle : Icons.cancel,
            color: AppColor.white,
          ),
          const SizedBox(
            width: 5,
          ),
          colorText(label, 14, color: AppColor.white)
        ],
      ),
    );
  }
}
