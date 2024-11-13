import 'package:flutter/material.dart';

class RatingAppbar extends StatelessWidget implements PreferredSizeWidget{
   @override
     final Size preferredSize;
  const RatingAppbar({super.key}) : preferredSize = const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: Image.asset('assets/images/rating_page_logo.png'),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      );
  }
  
 
}