import 'package:flutter/material.dart';
import 'package:iitf_flutter_tab/app/common_widgets/svg_icons/svg_widget.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final VoidCallback ontap;

  const CommonAppBar({super.key, required this.ontap})
      : preferredSize = const Size.fromHeight(90.0);

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Container(
      // height: 120.0, // Set the container height to 120
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x1F000000), // #0000001F with 12% opacity
            offset: Offset(0, 4),
            blurRadius: 16,
          ),
        ],
      ),
      child: AppBar(
        leading: IconButton(
          icon: svgWidget('assets/svg/Profile.svg'),
          onPressed: ontap,
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: size.height * 0.035,
            // ),
            Text(
              "Welcome",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            Text(
              "Stall 01",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors
            .transparent, // Make AppBar background transparent to use container color
        elevation: 0, // Remove default elevation
      ),
    );
  }
}
