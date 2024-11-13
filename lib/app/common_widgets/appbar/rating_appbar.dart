import 'package:flutter/material.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';

class RatingAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final String subTitle;
  const RatingAppbar({super.key, required this.title, required this.subTitle})
      : preferredSize = const Size.fromHeight(70.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Image.asset('assets/images/rating_page_logo.png'),
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
    );
  }
}
