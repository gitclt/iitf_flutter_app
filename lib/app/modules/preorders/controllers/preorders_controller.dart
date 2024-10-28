import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreordersController extends GetxController with  GetSingleTickerProviderStateMixin {
     late TabController tabcontroller;

  @override
  void onInit() {
    tabcontroller = TabController(length: 3, vsync: this);
    super.onInit();
  }
}
