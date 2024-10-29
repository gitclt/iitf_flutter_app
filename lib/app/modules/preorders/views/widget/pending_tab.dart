import 'package:flutter/material.dart';
import 'package:iitf_flutter_tab/app/common_widgets/container/order_container.dart';
import 'package:iitf_flutter_tab/app/common_widgets/text/text_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';

class PendingTab extends StatelessWidget {
  const PendingTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            colorText('No. of orders : 20', 18, color: AppColor.primary),
            const VerticalDivider(),
            colorText('Order Value : ₹1200.00', 18, color: AppColor.primary)
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const OrderContainer(
                    type: 'pending',
                    itemname: "Rope",
                    discription: "cultural",
                    qty: '01',
                    price: '220.00',
                    offerprice: '180.00',
                    date: '24/10/24',
                    name: 'Rajesh',
                    phone: '1234567890',
                  );
                }))
      ],
    );
  }
}
