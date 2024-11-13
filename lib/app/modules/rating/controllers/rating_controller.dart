import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/constants/strings.dart';
import 'package:iitf_flutter_tab/app/data/model/product/product_model.dart';
import 'package:iitf_flutter_tab/app/data/model/rating/rating_add_model.dart';
import 'package:iitf_flutter_tab/app/domain/entity/dropdown_entity.dart';
import 'package:iitf_flutter_tab/app/domain/repositories/product/product_repository.dart';
import 'package:iitf_flutter_tab/app/domain/repositories/rating/rating_repository.dart';
import 'package:iitf_flutter_tab/app/utils/utils.dart';

class RatingController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final productrepo = ProductRepository();
  RxList<Product> productData = <Product>[].obs;
    RxBool isProductLoading = false.obs;
  RxBool isLoading = false.obs;
  final _repo = RatingRepository();
  RxString rating = ''.obs;
  RxString error = ''.obs;
  void setError(String value) => error.value = value;

  var states = <DropDownModel>[].obs;
  DropDownModel? selectedState;
  void loadStates() {
    states.value = [
      DropDownModel(id: 'AndhraPradesh', name: 'Andhra Pradesh'),
      DropDownModel(id: 'ArunachalPradesh', name: 'Arunachal Pradesh'),
      DropDownModel(id: 'Assam', name: 'Assam'),
      DropDownModel(id: 'Bihar', name: 'Bihar'),
      DropDownModel(id: 'Chhattisgarh', name: 'Chhattisgarh'),
      DropDownModel(id: 'Goa', name: 'Goa'),
      DropDownModel(id: 'Gujarat', name: 'Gujarat'),
      DropDownModel(id: 'Haryana', name: 'Haryana'),
      DropDownModel(id: 'HimachalPradesh', name: 'Himachal Pradesh'),
      DropDownModel(id: 'Jharkhand', name: 'Jharkhand'),
      DropDownModel(id: 'Karnataka', name: 'Karnataka'),
      DropDownModel(id: 'Kerala', name: 'Kerala'),
      DropDownModel(id: 'MadhyaPradesh', name: 'Madhya Pradesh'),
      DropDownModel(id: 'Maharashtra', name: 'Maharashtra'),
      DropDownModel(id: 'Manipur', name: 'Manipur'),
      DropDownModel(id: 'Meghalaya', name: 'Meghalaya'),
      DropDownModel(id: 'Mizoram', name: 'Mizoram'),
      DropDownModel(id: 'Nagaland', name: 'Nagaland'),
      DropDownModel(id: 'Odisha', name: 'Odisha'),
      DropDownModel(id: 'Punjab', name: 'Punjab'),
      DropDownModel(id: 'Rajasthan', name: 'Rajasthan'),
      DropDownModel(id: 'Sikkim', name: 'Sikkim'),
      DropDownModel(id: 'TamilNadu', name: 'Tamil Nadu'),
      DropDownModel(id: 'Telangana', name: 'Telangana'),
      DropDownModel(id: 'Tripura', name: 'Tripura'),
      DropDownModel(id: 'Uttarakhand', name: 'Uttarakhand'),
      DropDownModel(id: 'UttarPradesh', name: 'Uttar Pradesh'),
      DropDownModel(id: 'WestBengal', name: 'West Bengal'),
      DropDownModel(id: 'Other', name: 'Other'),
    ];
  }

  // Method to handle state selection
  void onStateSelected(DropDownModel? state) {
    if (state == null) return;
    selectedState = state;
    update(); // Notify the UI
  }

  void onInit() {
    super.onInit();
    getProCategoryList();
    loadStates();
    // Set landscape orientation when this page is initialized
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void onClose() {
    // Reset orientation to default when this page is closed
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.onClose();
  }

  void getProCategoryList() async {
    productData.clear();
     isProductLoading(true);
    final res =
        await productrepo.getProductList(stallid: LocalStorageKey.stallId);
    res.fold((failure) {
       isProductLoading(false);
      setError(error.toString());
    }, (resData) {
      if (resData.data != null) {
         isProductLoading(false);
        productData.addAll(resData.data!);
      }
    });
  }
  //add

  void add() async {
    isLoading(true);
    final res = await _repo.addRating(
        name: nameController.text,
        phone: phoneController.text,
        ratingvalue: rating.value,
        stallid: LocalStorageKey.stallId,
        discription: descriptionController.text);
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);

          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');
          clrValue();
        }
      },
    );
  }

  clrValue() {
    nameController.clear();
    phoneController.clear();
    descriptionController.clear();
    rating = ''.obs;
  }
}
