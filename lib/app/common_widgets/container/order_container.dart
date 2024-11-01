import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/button/approve_button.dart';
import 'package:iitf_flutter_tab/app/common_widgets/svg_icons/svg_widget.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';
import 'package:iitf_flutter_tab/app/core/assets/image_assets.dart';

class OrderContainer extends StatelessWidget {
  final String type;
  final String itemname,
      qty,
      price,
      offerprice,
      date,
      name,
      phone,
      discription,
      imageurl;
  final VoidCallback? approveClick;
  final VoidCallback? rejectClick;
  const OrderContainer({
    super.key,
    required this.type,
    required this.itemname,
    required this.qty,
    required this.price,
    required this.offerprice,
    required this.date,
    required this.name,
    required this.phone,
    required this.discription,
    required this.imageurl,
    this.approveClick,
    this.rejectClick,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
          Image.network(
            height: size.height * 0.1,
            width: size.width * 0.15,
            imageurl,
            errorBuilder: (context, error, stackTrace) => SizedBox(
              height: size.height * 0.1,
              width: size.width * 0.15,
              child: Column(
                children: [
                  Center(
                    child: Icon(
                      Icons.error,
                      color: AppColor.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Image not found',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.02,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boldText(itemname, fontSize: 18),
              height,
              colorText(discription, 14),
              height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  svgWidget(SvgAssets.qtyIcon),
                  width,
                  greyText('Qty : $qty'),
                  const VerticalDivider(),
                  svgWidget(SvgAssets.priceIcon),
                  width,
                  greyText('Total Price : $price'),
                  const VerticalDivider(),
                  svgWidget(SvgAssets.offerIcon),
                  width,
                  greyText('Offer Price : $offerprice'),
                  const VerticalDivider(),
                  svgWidget(SvgAssets.dateIcon),
                  width,
                  greyText('Date : $date'),
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
                  greyText('Name : $name'),
                  const VerticalDivider(),
                  svgWidget(SvgAssets.callIcon),
                  width,
                  greyText('Phone : $phone'),
                ],
              ),
              height,
              Visibility(
                visible: type == 'pending' ? true : false,
                child: Row(
                  children: [
                    ApproveButton(
                      ontap: () {
                        approveClick!();
                      },
                      label: 'APPROVE',
                    ),
                    width,
                    ApproveButton(
                      ontap: () {
                        approveClick!();
                      },
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
