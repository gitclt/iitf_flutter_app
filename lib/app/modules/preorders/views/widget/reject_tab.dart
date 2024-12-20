import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iitf_flutter_tab/app/common_widgets/container/order_container.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';
import 'package:iitf_flutter_tab/app/core/globals/date_time_formating.dart';
import 'package:iitf_flutter_tab/app/modules/preorders/controllers/preorders_controller.dart';

class RejectTab extends StatelessWidget {
  final PreordersController controller;
  const RejectTab({super.key, required this.controller});

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
                        imageurl: item.imageurl == null
                            ? 'assets/svg/dummy_image.svg'
                            : item.imageurl ?? '',
                        type: 'reject',
                        itemname: item.productName ?? '',
                        id: item.id.toString(),
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
}
