import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/button/common_button.dart';
import 'package:iitf_flutter_tab/app/common_widgets/drop_down/drop_down3_widget.dart';
import 'package:iitf_flutter_tab/app/common_widgets/svg_icons/svg_widget.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';
import 'package:iitf_flutter_tab/app/modules/reports/controllers/reports_controller.dart';

class EnquiryTabView extends GetView<ReportsController> {
  const EnquiryTabView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final width = size.width * 0.32;
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 15,
              runSpacing: 12,
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                DropDown3Widget(
                  width: width,
                  label: 'State',
                  hint: '--Select State--',
                  selectedItem:
                      controller.sdState.id == null ? null : controller.sdState,
                  items: controller.stateDropList,
                  onChanged: (data) async {
                    if (data == null) return;
                    controller.sdState = data;
                  },
                ).paddingOnly(left: 5),
                const SizedBox(
                  width: 8,
                ),
                DropDown3Widget(
                  width: width,
                  label: 'Category',
                  hint: '--Select Category--',
                  selectedItem: controller.sdCategory.id == null
                      ? null
                      : controller.sdCategory,
                  items: controller.catDropList,
                  onChanged: (data) async {
                    if (data == null) return;
                    controller.sdCategory = data;
                  },
                ).paddingOnly(right: 5),
                SizedBox(
                    width: size.width * 0.22,
                    height: size.height * 0.04,
                    child: CommonButton(
                        onClick: () {
                          controller.getEnquiry();
                        },
                        label: 'search'))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.enqData.length,
                  itemBuilder: (context, index) {
                    final item = controller.enqData[index];
                    return EnquiryListCard(
                            name: item.name ?? '',
                            mob: item.mobile ?? '',
                            place: item.state ?? '',
                            description: item.enquiry.toString())
                        .paddingOnly(bottom: 8);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class EnquiryListCard extends StatelessWidget {
  final String name;
  final String mob;
  final String place;
  final String description;
  const EnquiryListCard(
      {super.key,
      required this.name,
      required this.mob,
      required this.place,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.listBorderColor),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              svgWidget('assets/svg/person.svg', color: Colors.blue, size: 30),
              const SizedBox(
                width: 4,
              ),
              boldText(name, fontSize: 16),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Row(
                children: [
                  svgWidget('assets/svg/phone.svg',
                      color: Colors.blue, size: 30),
                  const SizedBox(
                    width: 4,
                  ),
                  boldText(mob, fontSize: 16),
                ],
              ),
              const SizedBox(
                width: 12,
              ),
              Row(
                children: [
                  svgWidget('assets/svg/location.svg',
                      color: Colors.blue, size: 30),
                  const SizedBox(
                    width: 4,
                  ),
                  boldText(place, fontSize: 16),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          boldText('Enquiry', color: AppColor.primary).paddingOnly(bottom: 6),
          greyText(description)
        ],
      ),
    );
  }
}
