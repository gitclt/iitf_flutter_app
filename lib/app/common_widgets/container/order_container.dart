import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/button/approve_button.dart';
import 'package:iitf_flutter_tab/app/common_widgets/svg_icons/svg_widget.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';
import 'package:iitf_flutter_tab/app/core/assets/image_assets.dart';

class OrderContainer extends StatelessWidget {
  final String type;
  const OrderContainer({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    const height = SizedBox(
      height: 8,
    );
    const width = SizedBox(
      width: 8,
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.dividerColor)),
      child: Row(
        children: [
          svgWidget('assets/svg/rope.svg'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boldText("Rope", fontSize: 18),
              height,
              colorText("culture", 14),
              height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  svgWidget(SvgAssets.qtyIcon),
                  width,
                  greyText('Qty : 01'),
                  const VerticalDivider(),
                  svgWidget(SvgAssets.priceIcon),
                  width,
                  greyText('Total Price : 220.00'),
                  const VerticalDivider(),
                  svgWidget(SvgAssets.offerIcon),
                  width,
                  greyText('Offer Price : 180.00'),
                  const VerticalDivider(),
                  svgWidget(SvgAssets.dateIcon),
                  width,
                  greyText('Date : 24/10/24'),
                  const VerticalDivider(),
                  Visibility(
                    visible: type == 'pending' ? false : true,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: type == 'approve'
                                ? const Color(0xff30BE41)
                                : const Color(0xffFF0606)),
                      ),
                      child: colorText(type, 12,
                          color: type == 'approve'
                              ? const Color(0xff30BE41)
                              : const Color(0xffFF0606)),
                    ),
                  )
                ],
              ),
              height,
              boldText('Customer Details', fontSize: 18),
              height,
              Row(
                children: [
                  svgWidget(SvgAssets.personIcon),
                  width,
                  greyText('Name : Rajesh'),
                  const VerticalDivider(),
                  svgWidget(SvgAssets.callIcon),
                  width,
                  greyText('Phone : 1234 567 890'),
                ],
              ),
              height,
              Visibility(
                visible: type == 'pending' ? true : false,
                child: const Row(
                  children: [
                    ApproveButton(
                      label: 'APPROVE',
                    ),
                    width,
                    ApproveButton(
                      label: 'REJECT',
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ).paddingOnly(bottom: 10);
  }
}
