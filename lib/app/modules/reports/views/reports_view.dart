import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/appbar/common_appbar.dart';
import 'package:iitf_flutter_tab/app/modules/reports/views/report_tab_view.dart';

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
        body: const DefaultTabController(
          length: 2,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              TabBar(
                  physics: NeverScrollableScrollPhysics(),
                  labelStyle: TextStyle(fontSize: 18),
                  labelColor: Colors.black,
                  unselectedLabelColor: Color(0xFFA4A4A4),
                  tabs: [
                    Tab(text: 'Feedback'),
                    Tab(text: 'Enquiry'),
                  ]),
              Expanded(
                  child:
                      TabBarView(children: [ReportTabView(), ReportTabView()]))
            ],
          ),
        ));
  }
}
