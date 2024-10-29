import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/data/model/product_category/category_model.dart';
import 'package:iitf_flutter_tab/app/domain/entity/status.dart';
import 'package:iitf_flutter_tab/app/domain/repositories/product_category/category_response.dart';
import 'package:iitf_flutter_tab/app/routes/app_pages.dart';
import 'package:iitf_flutter_tab/app/utils/utils.dart';

class CategoryController extends GetxController {
   final rxRequestStatus = Status.completed.obs;
  RxString error = ''.obs;
  final _repo = ProCategoryRepository();
  RxList<Category> data = <Category>[].obs;
  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  RxBool isLoading = false.obs;
  String editId = '';
  @override
  void onInit() {
    get();
    super.onInit();
  }

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;
  void get() async {
    setRxRequestStatus(Status.loading);
    data.clear();
    final res = await _repo.getProCategoryList();
    res.fold((failure) {
      setRxRequestStatus(Status.completed);
      setError(error.toString());
    }, (resData) {
      setRxRequestStatus(Status.completed);
      if (resData.data != null) {
        data.addAll(resData.data!);
      }
    });
  }

  
  //add

  void add() async {
    isLoading(true);
    final res = await _repo.addProCategory(nameController.text);
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.category);
          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

          get();

          // clrValue();
        }
      },
    );
  }
   //edit
  void editClick(Category data) async {
    nameController = TextEditingController(text: data.category);
    editId = data.id.toString();
    Get.rootDelegate.toNamed(Routes.categoryAdd);
  }
  edit() async {
    isLoading(true);
    final res =
        await _repo.editProCategory(id: editId, name: nameController.text);
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.category);
          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

          get();
          Get.rootDelegate.toNamed(Routes.category);
          // clrValue();
        }
      },
    );
  }
  //delete
  void delete() async {
    final res = await _repo.deleteProCategory(id: editId);
    res.fold((failure) {
      Utils.snackBar('Category Error', failure.message);
      setError(error.toString());
    }, (resData) {
      Utils.snackBar('Category', resData.message!);
      get();
    });
  }

  clear() {
    editId = '';
    nameController.clear();
  }
}
