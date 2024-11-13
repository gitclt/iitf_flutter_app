import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/constants/strings.dart';
import 'package:iitf_flutter_tab/app/data/model/home/home_model.dart';
import 'package:iitf_flutter_tab/app/domain/repositories/home/home_repository.dart';

class HomeController extends GetxController {
    RxBool isLoading = false.obs;
 
     final _repo = HomeRepository();
  RxList<HomeResponse> data = <HomeResponse>[].obs;
  RxString error = ''.obs;
  
    @override
  void onInit() {
    get();
    super.onInit();
  }

   void setError(String value) => error.value = value;

  void get() async {
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

}
