import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/button/add_button.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';
import 'package:iitf_flutter_tab/app/modules/rating/controllers/rating_controller.dart';
import 'package:iitf_flutter_tab/app/modules/rating/views/widget/details_popup.dart';

class FeedbackView extends GetView<RatingController> {
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ratingContainer(
              context,
              'How would you rate your overall experience at the Kerala Pavilion?',
              RatingBar.builder(
                initialRating: double.tryParse(controller.rating1.value) ?? 5,
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: AppColor.ratingColor,
                ),
                onRatingUpdate: (rating) {
                  controller.rating1.value = rating.toInt().toString();
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ratingContainer(
              context,
              'How satisfied are you with the product offerings and displays at our stall?',
              RatingBar.builder(
                initialRating: double.tryParse(controller.rating2.value) ?? 5,
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: AppColor.ratingColor,
                ),
                onRatingUpdate: (rating) {
                  controller.rating2.value = rating.toInt().toString();
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: controller.descriptionController,

              decoration: InputDecoration(
                hintText: 'Any Suggestions',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Color(0xFFDDDDDD),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Color(0xFFDDDDDD),
                    width: 1,
                  ),
                ),
              ),
              maxLines: 5, // Sets the maximum number of lines
              minLines: 5,
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            AddButton(
              height: size.height * 0.08,
              onClick: () {
                Get.dialog(const RatingDetailsPopup());
              },
              label: 'SUBMIT',
            )
          ],
        ),
      ),
    );
  }
}

Widget ratingContainer(
    BuildContext context, String rateQues, Widget ratingBar) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 40.0,
            spreadRadius: 0.0,
            offset: Offset(0, 0),
          ),
        ]),
    child: Column(
      children: [
        boldText(rateQues, fontWeight: FontWeight.w500, fontSize: 24),
        const SizedBox(
          height: 25,
        ),
        ratingBar
      ],
    ),
  );
}
