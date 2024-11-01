import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/constants/strings.dart';
import 'package:iitf_flutter_tab/app/data/model/order/order_model.dart';
import 'package:iitf_flutter_tab/app/domain/entity/status.dart';
import 'package:iitf_flutter_tab/app/domain/repositories/order/order_repository.dart';
import 'package:iitf_flutter_tab/app/utils/utils.dart';

class PreordersController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabcontroller;
  final rxRequestStatus = Status.completed.obs;
  RxString error = ''.obs;
  RxString ordercount = ''.obs;
  RxString orderValue = ''.obs;
  final _repo = OrderRepository();

  RxList<OrderData> data = <OrderData>[].obs;

  // @override
  // void onInit() {
  //   tabcontroller = TabController(length: 3, vsync: this);

  //   super.onInit();
  // }
  @override
  void onInit() {
    tabcontroller = TabController(length: 3, vsync: this);
    tabcontroller.addListener(() {
      // Automatically call get based on the selected tab's status
      updateOrderListBasedOnTab(tabcontroller.index);
    });
    get(status: 'pending');
    super.onInit();
  }

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;
  void get({required String status}) async {
    setRxRequestStatus(Status.loading);
    data.clear();
    final res = await _repo.getOrderList(
      stallid: LocalStorageKey.stallId,
      page: 1,
      pagesize: 10,
      status: status,
    );
    res.fold((failure) {
      setRxRequestStatus(Status.completed);
      setError(error.toString());
    }, (resData) {
      setRxRequestStatus(Status.completed);
      if (resData.data != null) {
        ordercount.value = resData.totalCount?.toString() ?? '0';
        orderValue.value = resData.totalPrice?.toString() ?? '0';
        data.addAll(resData.data!);
      }
    });
  }

  void updateOrderListBasedOnTab(int tabIndex) {
    switch (tabIndex) {
      case 0:
        get(status: 'pending');
        break;
      case 1:
        get(status: 'approved');
        break;
      case 2:
        get(status: 'rejected');
        break;
    }
  }




  //update
  void updateStatus({required String id,status}) async {
    final res = await _repo.updateStatus(id:id ,status: status);
    res.fold((failure) {
      Utils.snackBar(' Error', failure.message);
      setError(error.toString());
    }, (resData) {
     
      Utils.snackBar('Order', resData.message!);
    //  get();
    });
  }
}

//  get(status: tabcontroller.index == 0 ? 'pending' : 'approved');