import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/constants/strings.dart';
import 'package:iitf_flutter_tab/app/domain/repositories/rating/rating_repository.dart';
import 'package:iitf_flutter_tab/app/utils/utils.dart';

class RatingController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  final _repo = RatingRepository();
  RxString rating = ''.obs;
  RxString error = ''.obs;
  void setError(String value) => error.value = value;

  //add

  void add() async {
    isLoading(true);
    final res = await _repo.addRating(
      name: nameController.text,
      phone: phoneController.text,
      ratingvalue: rating.value,
      stallid: LocalStorageKey.stallId,
      discription:descriptionController.text

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
