import 'package:flutter/material.dart';
import 'package:iitf_flutter_tab/app/common_widgets/container/order_container.dart';

class PendingTab extends StatelessWidget {
  const PendingTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [],
        ),
        Expanded(
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const OrderContainer(
                    type: 'pending',
                  );
                }))
      ],
    );
  }
}
