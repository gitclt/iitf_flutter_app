import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/svg_icons/svg_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';

class HomeCard extends StatelessWidget {
  final String imagepath;
  final String tittle;
  final String subtitle;
  final String count;
  final Color color;
  final VoidCallback ontap;
  const HomeCard({
    super.key,
    required this.imagepath,
    required this.tittle,
    required this.subtitle,
    required this.count,
    required this.color, required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color.withOpacity(0.2)),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              svgWidget(imagepath),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    tittle,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 24),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: AppColor.greyColor),
                  )
                ],
              ),
              const Spacer(),
              Text(
                count,
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 36, color: color),
              )
            ],
          ).paddingAll(5),
        ),
      ),
    );
  }
}
