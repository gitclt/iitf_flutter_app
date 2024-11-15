import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/constants/strings.dart';
import 'package:iitf_flutter_tab/app/data/model/enquiry/enquiry_model.dart';
import 'package:iitf_flutter_tab/app/data/model/rating/feedback_model.dart';
import 'package:iitf_flutter_tab/app/domain/entity/status.dart';
import 'package:iitf_flutter_tab/app/domain/repositories/rating/rating_repository.dart';

class ReportsController extends GetxController {
  final rxRequestStatus = Status.completed.obs;
  RxString error = ''.obs;
  final _repo = RatingRepository();
  RxList<FeedbackData> feedData = <FeedbackData>[].obs;
  RxList<EnquiryData> enqData = <EnquiryData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getFeedback();
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

  void getEnquiry() async {
    setRxRequestStatus(Status.loading);
    enqData.clear();
    final res = await _repo.getEnquiry(LocalStorageKey.stallId);
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
