import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';
import 'package:iitf_flutter_tab/app/constants/strings.dart';

class RatingAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final String subTitle;
  const RatingAppbar({super.key, required this.title, required this.subTitle})
      : preferredSize = const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: LocalStorageKey.image.isEmpty
          ? null
          : CachedNetworkImage(
              imageUrl: LocalStorageKey.image,
              fit: BoxFit.cover,
            ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          boldText(title, fontSize: 18),
          const SizedBox(
            height: 6,
          ),
          colorText(subTitle, 16)
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 5,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Image.asset(
            'assets/images/rating_kerala_logo.png',
            width: 50,
            height: 50,
          ),
        )
      ],
    );
  }
}
