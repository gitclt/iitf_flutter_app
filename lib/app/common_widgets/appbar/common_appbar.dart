import 'package:flutter/material.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final VoidCallback ontap;

  const CommonAppBar({super.key, required this.ontap})
      : preferredSize = const Size.fromHeight(70.0);

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
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.blackColor,
          ),
          onPressed: ontap,
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
