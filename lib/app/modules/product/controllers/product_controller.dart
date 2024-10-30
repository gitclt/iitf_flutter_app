import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/data/model/product/product_model.dart';
import 'package:iitf_flutter_tab/app/domain/entity/dropdown_entity.dart';
import 'package:iitf_flutter_tab/app/domain/entity/status.dart';
import 'package:iitf_flutter_tab/app/domain/repositories/product/product_repository.dart';
import 'package:iitf_flutter_tab/app/domain/repositories/product_category/category_response.dart';
import 'package:iitf_flutter_tab/app/routes/app_pages.dart';
import 'package:iitf_flutter_tab/app/utils/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';

class ProductController extends GetxController {
  final formkey = GlobalKey<FormState>();
  var isVisible = false.obs;
  //  DropDownModel sdCat = DropDownModel();
  // RxList<DropDownModel> catDropList = <DropDownModel>[].obs;
  final rxRequestStatus = Status.completed.obs;
  RxString error = ''.obs;
  final _repo = ProductRepository();
  RxList<Product> data = <Product>[].obs;
  DropDownModel sdCat = DropDownModel();
  RxList<DropDownModel> categoryDropList = <DropDownModel>[].obs;
  final catrepo = ProCategoryRepository();
  RxBool isCatLoading = false.obs;
  // final formkey = GlobalKey<FormState>();
  // var pickedFileBytes1 = Rxn<Uint8List>();
  // var encodedData1 = ''.obs;
  String imageName1 = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController offerController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxBool isLoading = false.obs;
  String editId = '';
  var pickedFilePath1 = ''.obs;
  @override
  void onInit() {
    get();
    getCat();
    super.onInit();
  }

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;
  void get() async {
    setRxRequestStatus(Status.loading);
    data.clear();
    final res = await _repo.getProductList();
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
    final res = await _repo.addProduct(
        cadId: int.tryParse('${sdCat.id}'),
        name: nameController.text,
        code: codeController.text,
        image: imageName1,
        imagedata: encodedData.value,
        price: priceController.text,
        offerPrice: offerController.text,
        description: descriptionController.text,
        visible: '1');
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.product);
          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

          get();

          // clrValue();
        }
      },
    );
  }

  void getCat() async {
    isCatLoading(true);
    categoryDropList.clear();
    final res = await catrepo.getProCategoryList();
    res.fold((failure) {
      isCatLoading(false);
      Utils.snackBar('Error', failure.message);
      setError(error.toString());
    }, (resData) {
      isCatLoading(false);

      for (var item in resData.data!) {
        categoryDropList
            .add(DropDownModel(id: item.id.toString(), name: item.category));
      }
    });
  }

  //edit
  void editClick(Product data) async {
    nameController = TextEditingController(text: data.category);
    editId = data.id.toString();
    Get.rootDelegate.toNamed(Routes.productAdd);
  }

  edit() async {
    isLoading(true);
    final res = await _repo.editProduct(id: editId, name: nameController.text);
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

          clear();
        }
      },
    );
  }

   RxString imageName = ''.obs; // Observable for the file name
  Rxn<Uint8List?> pickedFileBytes = Rxn<Uint8List?>(); // For file bytes
  RxString encodedData = ''.obs; // For Base64 encoded data

  // Function to pick an image and set the name
  Future<void> pickImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null && result.files.single.bytes != null) {
      // Set the image name and encode data to Base64
      imageName.value = result.files.single.name;
      pickedFileBytes.value = result.files.single.bytes;
      encodedData.value = base64Encode(pickedFileBytes.value!);
    } else {
      // Reset image name if no file selected
      imageName.value = '';
    }
  }

// // Function to pick image and generate a unique name
//   void pickImage(int imageIndex) async {
//     String dateFormat = DateFormat('yyyy-MM-dd').format(DateTime.now());

//     // Generate a unique identifier using the current timestamp
//     String uniqueId = DateTime.now().millisecondsSinceEpoch.toString();

//     if (GetPlatform.isWeb) {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.image,
//         allowMultiple: false,
//       );

//       if (result != null) {
//         PlatformFile file = result.files.single;

//         // Update the specific image's state based on the imageIndex

//         pickedFileBytes1.value = file.bytes;
//         pickedFilePath1.value = file.name;
//         imageName1 = "$dateFormat-$uniqueId.${file.name.split('.').last}";
//         encodedData1.value = base64Encode(pickedFileBytes1.value!);
//       }
//     } else {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.image,
//         allowMultiple: false,
//       );

//       if (result != null) {
//         // Update the specific image's state based on the imageIndex

//         pickedFilePath1.value = result.files.single.path!;
//         var pickedImageBytes1 = await File(pickedFilePath1.value).readAsBytes();
//         imageName1 =
//             "$dateFormat-$uniqueId.${pickedFilePath1.value.split('.').last}";
//         encodedData1.value = base64Encode(pickedImageBytes1);
//       }
//     }
//   }

  //delete
  void delete() async {
    final res = await _repo.deleteProduct(id: editId);
    res.fold((failure) {
      Utils.snackBar('Category Error', failure.message);
      setError(error.toString());
    }, (resData) {
      Get.rootDelegate.toNamed(Routes.category);
      Utils.snackBar('Category', resData.message!);
      get();
    });
  }

  clear() {
    editId = '';
    nameController.clear();
  }
}
