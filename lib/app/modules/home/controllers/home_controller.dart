import 'dart:convert';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/constants/strings.dart';
import 'package:iitf_flutter_tab/app/data/model/enquiry/add_enquiry_model.dart';
import 'package:iitf_flutter_tab/app/data/model/home/home_model.dart';
import 'package:iitf_flutter_tab/app/data/model/product_category/category_model.dart';
import 'package:iitf_flutter_tab/app/data/model/rating/rating_add_model.dart';
import 'package:iitf_flutter_tab/app/data/network/check_internet.dart';
import 'package:iitf_flutter_tab/app/domain/repositories/home/home_repository.dart';
import 'package:iitf_flutter_tab/app/domain/repositories/product_category/category_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  final _catrepo = ProCategoryRepository();
  final _repo = HomeRepository();
  RxList<HomeResponse> data = <HomeResponse>[].obs;
  RxString error = ''.obs;
  RxList<Category> categories = <Category>[].obs;
  @override
  void onInit() {
    checkHome();
    super.onInit();
  }

  void checkHome() async {
    final status = await isInternetAvailable();

    if (status) {
      gethome();
      getcat();
    } else {
      getCatLocalDb();
      getRatingLocalDb();
      getEnqLocalDb();
    }
  }

  void setError(String value) => error.value = value;

  void gethome() async {
    isLoading(true);
    data.clear();
    final res = await _repo.getCountList(stallid: LocalStorageKey.stallId);
    res.fold((failure) {
      isLoading(false);

      setError(error.toString());
    }, (resData) {
      isLoading(false);
      if (resData.data != null) {
        data.addAll(resData.data!);
      }
    });
  }

  void getcat() async {
    data.clear();
    final res =
        await _catrepo.getProCategoryList(stallid: LocalStorageKey.stallId);
    res.fold((failure) {
      setError(error.toString());
    }, (resData) {
      if (resData.data != null) {
        categories.addAll(resData.data!);
        saveCatToLocal();
      }
    });
  }

  saveCatToLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("catData", jsonEncode(categories));
  }

  getCatLocalDb() async {
    categories.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("catData")) {
      categories.value = List<Map<String, dynamic>>.from(
              jsonDecode(prefs.getString("catData")!))
          .map((x) => Category.fromJson(x))
          .toList();
    }
  }

  /// rating
  ///
  RxList<RatingAddModel> ratingDataList = <RatingAddModel>[].obs;

  addToRating(RatingAddModel add) {
    ratingDataList.add(add);
    saveRatingToLocal();
  }

  saveRatingToLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("ratingData", jsonEncode(categories));
  }

  getRatingLocalDb() async {
    ratingDataList.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("ratingData")) {
      ratingDataList.value = List<Map<String, dynamic>>.from(
              jsonDecode(prefs.getString("ratingData")!))
          .map((x) => RatingAddModel.fromJson(x))
          .toList();
    }
  }

  /// Enruiry
  ///
  RxList<EnqAddModel> enqDataList = <EnqAddModel>[].obs;

  addToEnq(EnqAddModel add) {
    enqDataList.add(add);
    saveRatingToLocal();
  }

  saveEnqToLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("enqData", jsonEncode(categories));
  }

  getEnqLocalDb() async {
    enqDataList.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("enqData")) {
      enqDataList.value = List<Map<String, dynamic>>.from(
              jsonDecode(prefs.getString("enqData")!))
          .map((x) => EnqAddModel.fromJson(x))
          .toList();
    }
  }
}
