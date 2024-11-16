import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/constants/const_values.dart';
import 'package:iitf_flutter_tab/app/constants/strings.dart';
import 'package:iitf_flutter_tab/app/data/model/enquiry/enquiry_model.dart';
import 'package:iitf_flutter_tab/app/data/model/rating/feedback_model.dart';
import 'package:iitf_flutter_tab/app/domain/entity/dropdown_entity.dart';
import 'package:iitf_flutter_tab/app/domain/entity/status.dart';
import 'package:iitf_flutter_tab/app/domain/repositories/product_category/category_response.dart';
import 'package:iitf_flutter_tab/app/domain/repositories/rating/rating_repository.dart';

class ReportsController extends GetxController {
  final rxRequestStatus = Status.completed.obs;
  RxString error = ''.obs;
  final _repo = RatingRepository();
  RxList<FeedbackData> feedData = <FeedbackData>[].obs;
  RxList<EnquiryData> enqData = <EnquiryData>[].obs;
  final isCatLoading = false.obs;

  DropDownModel sdState = DropDownModel();
  DropDownModel sdCategory = DropDownModel();
  RxList<DropDownModel> stateDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> catDropList = <DropDownModel>[].obs;
  final catRepo = ProCategoryRepository();

  @override
  void onInit() {
    super.onInit();
    getFeedback();
    getStates();
    getCategory();
  }

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;

  void getFeedback() async {
    setRxRequestStatus(Status.loading);
    feedData.clear();
    final res = await _repo.getFeedback(LocalStorageKey.stallId);
    res.fold((failure) {
      setRxRequestStatus(Status.completed);
      setError(error.toString());
    }, (resData) {
      setRxRequestStatus(Status.completed);
      if (resData.data != null) {
        feedData.addAll(resData.data!);
      }
    });
  }

  void getStates() {
    for (var s in AppConstValue().states) {
      stateDropList.add(DropDownModel(id: s.id, name: s.name));
    }
  }

  void getCategory() async {
    isCatLoading(true);
    catDropList.clear();
    final res =
        await catRepo.getProCategoryList(stallid: LocalStorageKey.stallId);
    res.fold((failure) {
      isCatLoading(false);
      setError(error.toString());
    }, (resData) {
      isCatLoading(false);
      if (resData.data != null) {
        for (var cat in resData.data!) {
          catDropList
              .add(DropDownModel(id: cat.id.toString(), name: cat.category));
        }
      }
    });
  }

  void getEnquiry() async {
    setRxRequestStatus(Status.loading);
    enqData.clear();
    final res = await _repo.getEnquiry(LocalStorageKey.stallId,
        state: sdState.id, catId: sdCategory.id);
    res.fold((failure) {
      setRxRequestStatus(Status.completed);
      setError(error.toString());
    }, (resData) {
      setRxRequestStatus(Status.completed);
      if (resData.data != null) {
        enqData.addAll(resData.data!);
      }
    });
  }

  
}
