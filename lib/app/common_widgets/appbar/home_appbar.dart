import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iitf_flutter_tab/app/common_widgets/svg_icons/svg_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';
import 'package:iitf_flutter_tab/app/constants/strings.dart';
import 'package:iitf_flutter_tab/app/core/assets/image_assets.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final VoidCallback ontap;

  const HomeAppbar({super.key, required this.ontap})
      : preferredSize = const Size.fromHeight(70.0);

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Container(
      // height: 120.0, // Set the container height to 120
      padding: const EdgeInsets.all(5),
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
        title: Row(
          children: [
            IconButton(
              icon: svgWidget(SvgAssets.appbarIcon),
              onPressed: ontap,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: size.height * 0.035,
                // ),

                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        LocalStorageKey.stallName,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                  ],
                ),
                RatingBarIndicator(
                  rating: LocalStorageKey.rating,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: AppColor.primary,
                  ),
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
              ],
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
