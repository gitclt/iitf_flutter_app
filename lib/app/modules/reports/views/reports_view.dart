import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/appbar/common_appbar.dart';
import 'package:iitf_flutter_tab/app/modules/reports/views/widgets/enquiry_tab_view.dart';
import 'package:iitf_flutter_tab/app/modules/reports/views/widgets/feedback_tab_view.dart';

import '../controllers/reports_controller.dart';

class ReportsView extends GetView<ReportsController> {
  const ReportsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          ontap: () {
            Get.back();
          },
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TabBar(
                  physics: const NeverScrollableScrollPhysics(),
                  labelStyle: const TextStyle(fontSize: 18),
                  labelColor: Colors.black,
                  unselectedLabelColor: const Color(0xFFA4A4A4),
                  onTap: (int index) {
                    if (index == 0) {
                      controller.getFeedback();
                    } else if (index == 1) {
                      controller.getEnquiry();
                    }
                  },
                  tabs: const [
                    Tab(text: 'Feedback'),
                    Tab(text: 'Enquiry'),
                  ]),
              const Expanded(
                  child:
                      TabBarView(children: [FeedbackTabView(), EnquiryTabView()]))
            ],
          ),
        ));
  }
}
