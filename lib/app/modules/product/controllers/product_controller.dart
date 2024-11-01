import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/constants/strings.dart';
import 'package:iitf_flutter_tab/app/data/model/product/product_model.dart';
import 'package:iitf_flutter_tab/app/domain/entity/dropdown_entity.dart';
import 'package:iitf_flutter_tab/app/domain/entity/status.dart';
import 'package:iitf_flutter_tab/app/domain/repositories/product/product_repository.dart';
import 'package:iitf_flutter_tab/app/domain/repositories/product_category/category_response.dart';
import 'package:iitf_flutter_tab/app/routes/app_pages.dart';
import 'package:iitf_flutter_tab/app/utils/format/date_format.dart';
import 'package:iitf_flutter_tab/app/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

class ProductController extends GetxController {
  final formkey = GlobalKey<FormState>();
  var isVisible = true.obs;
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

  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController offerController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController logoController = TextEditingController();
  RxBool isLoading = false.obs;
  String editId = '';
  String editImage = '';

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
      cadId: int.tryParse(sdCat.id!),
      name: nameController.text,
      code: codeController.text,
      image: imageName.value,
      imagedata: encodedData,
      price: priceController.text,
      stallid: LocalStorageKey.stallId,
      offerPrice: offerController.text,
      description: descriptionController.text,
      visible: isVisible.value ? '1' : '0',
    );
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
          clear();
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
    clear();
    nameController = TextEditingController(text: data.name ?? '');
    codeController = TextEditingController(text: data.code ?? '');
    editId = data.id.toString();
    sdCat = DropDownModel(id: data.catId!, name: data.category ?? '');
    logoController = TextEditingController(text: data.image ?? '');
    priceController = TextEditingController(text: data.price ?? '');
    isVisible(data.visibility == '0' ? false : true);
    offerController = TextEditingController(text: data.offerPrice ?? '');
    descriptionController = TextEditingController(text: data.description ?? '');
    editImage = data.image ?? '';
    imageName.value = data.image ?? '';
    Get.rootDelegate.toNamed(Routes.productAdd);
  }

  edit() async {
    isLoading(true);
    final res = await _repo.editProduct(
      id: editId,
      name: nameController.text,
      cadId: int.tryParse(sdCat.id!),
      code: codeController.text,
      image: imageName.value,
      imagedata: encodedData,
      oldImg: editImage,
      price: priceController.text,
      stallid: LocalStorageKey.stallId,
      offerPrice: offerController.text,
      description: descriptionController.text,
      visible: isVisible.value ? '1' : '0',
      isImgChed: editImage.isEmpty
          ? 'no'
          : logoController.value.text.trim() == editImage
              ? 'no'
              : 'yes',
    );
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

          clear();
        }
      },
    );
  }

  RxString imageName = ''.obs; // Observable for the file name
  Uint8List? pickedFileBytes; // For file bytes
  String? encodedData; // For Base64 encoded data

  // Function to pick an image and set the name
  Future<void> pickImage(ImageSource type) async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: type);

    if (image != null) {
      // Set the image name and encode data to Base64

      String dateFormat = DlDateFormat().getFormattedTimestamp();
      imageName.value = "$dateFormat.${image.name.split('.').last}";
      logoController.value = TextEditingValue(text: imageName.value);

      pickedFileBytes = await image.readAsBytes();
      encodedData = base64Encode(pickedFileBytes!);
    } else {
      // Reset image name if no file selected
      imageName.value = '';
    }
  }

  //delete
  void delete() async {
    final res = await _repo.deleteProduct(id: editId);
    res.fold((failure) {
      Utils.snackBar('Category Error', failure.message);
      setError(error.toString());
    }, (resData) {
      Get.rootDelegate.toNamed(Routes.product);
      Utils.snackBar('Category', resData.message!);
      get();
    });
  }

  clear() {
    editId = '';
    nameController.clear();
    imageName.value = ''; // Observable for the file name
    sdCat = DropDownModel();
    codeController.clear();
    logoController.clear();
    priceController.clear();
    offerController.clear();
    isVisible.value = true;
    descriptionController.clear();
    editImage = '';
    pickedFileBytes = null; // For file bytes
    encodedData = null; // For Base64 encoded data
  }
}
