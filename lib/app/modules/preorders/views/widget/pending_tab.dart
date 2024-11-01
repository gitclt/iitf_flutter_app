import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/container/order_container.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';
import 'package:iitf_flutter_tab/app/core/globals/date_time_formating.dart';
import 'package:iitf_flutter_tab/app/modules/preorders/controllers/preorders_controller.dart';

class PendingTab extends StatelessWidget {
  final PreordersController controller;
  const PendingTab({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                colorText('No. of orders : ${controller.ordercount}', 18,
                    color: AppColor.primary),
                const VerticalDivider(),
                colorText('Order Value :  ${controller.orderValue}', 18,
                    color: AppColor.primary)
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      final item = controller.data[index];
                      return OrderContainer(
                        approveClick: () {
                          // _showApproveDialog(context, item.id.toString());
                          _showConfirmationDialog(
                            context,
                            title: 'Approve Order',
                            content:
                                'Are you sure you want to approve this order?',
                            confirmAction: () {
                              controller.updateStatus(
                                  id: item.id.toString(), status: 'approved');
                              Get.back(); // Close the dialog
                            },
                          );
                        },
                        rejectClick: () {
                          _showConfirmationDialog(
                            context,
                            title: 'Reject Order',
                            content:
                                'Are you sure you want to reject this order?',
                            confirmAction: () {
                              controller.updateStatus(
                                  id: item.id.toString(), status: 'rejected');
                              Get.back(); // Close the dialog
                            },
                          );
                        },
                        imageurl: 'assets/svg/dummy_image.svg',
                        type: 'pending',
                        itemname: item.productName ?? '',
                        discription: item.category ?? '',
                        qty: item.quantity.toString(),
                        price: item.price.toString(),
                        offerprice: item.offerPrice.toString(),
                        date: dateFormatString(item.date ?? ''),
                        name: item.customer ?? '',
                        phone: item.mobile ?? '',
                      );
                    }))
          ],
        ));
  }



  void _showConfirmationDialog(BuildContext context,
      {required String title,
      required String content,
      required VoidCallback confirmAction}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: confirmAction,
              child: const Text('Confirm'),
            ),
            TextButton(
              onPressed: () {
                Get.back(); // Close the dialog on cancel
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
