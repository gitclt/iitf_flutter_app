import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/domain/entity/dropdown_entity.dart';

class ProductController extends GetxController {
   final formkey = GlobalKey<FormState>();
   var isVisible= false.obs;
   DropDownModel sdCat = DropDownModel();
  RxList<DropDownModel> catDropList = <DropDownModel>[].obs;
}
