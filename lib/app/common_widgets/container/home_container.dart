import 'package:flutter/material.dart';
import 'package:iitf_flutter_tab/app/common_widgets/svg_icons/svg_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';

class HomeContainer extends StatelessWidget {
  final String icon;
  final String label;
  final String count;
  const HomeContainer({
    super.key,
    required this.icon,
    required this.label,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
          right: size.width * 0.1, left: 12, bottom: 20, top: 20),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0x0F000000), // #0000000F in ARGB format
              offset: Offset(0, 0),
              blurRadius: 12,
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(20),
          color: AppColor.white,
          border: Border.all(color: AppColor.boxBorderColor)),
      child: Row(
        children: [
          svgWidget(icon),
          SizedBox(
            width: size.width * 0.008,
          ),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          Text(
            count,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: AppColor.primary),
          )
        ],
      ),
    );
  }
}
