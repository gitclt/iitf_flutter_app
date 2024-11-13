import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/constants/strings.dart';
import 'package:iitf_flutter_tab/app/domain/entity/dropdown_entity.dart';
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

   var states = <DropDownModel>[].obs;
  DropDownModel? selectedState;
   void loadStates() {
    states.value = [
      DropDownModel(id: '1', name: 'Andhra Pradesh'),
      DropDownModel(id: '2', name: 'Arunachal Pradesh'),
      DropDownModel(id: '3', name: 'Assam'),
      DropDownModel(id: '4', name: 'Bihar'),
      DropDownModel(id: '5', name: 'Chhattisgarh'),
      DropDownModel(id: '6', name: 'Goa'),
      DropDownModel(id: '7', name: 'Gujarat'),
      DropDownModel(id: '8', name: 'Haryana'),
      DropDownModel(id: '9', name: 'Himachal Pradesh'),
      DropDownModel(id: '10', name: 'Jharkhand'),
      DropDownModel(id: '11', name: 'Karnataka'),
      DropDownModel(id: '12', name: 'Kerala'),
      DropDownModel(id: '13', name: 'Madhya Pradesh'),
      DropDownModel(id: '14', name: 'Maharashtra'),
      DropDownModel(id: '15', name: 'Manipur'),
      DropDownModel(id: '16', name: 'Meghalaya'),
      DropDownModel(id: '17', name: 'Mizoram'),
      DropDownModel(id: '18', name: 'Nagaland'),
      DropDownModel(id: '19', name: 'Odisha'),
      DropDownModel(id: '20', name: 'Punjab'),
      DropDownModel(id: '21', name: 'Rajasthan'),
      DropDownModel(id: '22', name: 'Sikkim'),
      DropDownModel(id: '23', name: 'Tamil Nadu'),
      DropDownModel(id: '24', name: 'Telangana'),
      DropDownModel(id: '25', name: 'Tripura'),
      DropDownModel(id: '26', name: 'Uttar Pradesh'),
      DropDownModel(id: '27', name: 'Uttarakhand'),
      DropDownModel(id: '28', name: 'West Bengal'),
      DropDownModel(id: '29', name: 'Andaman and Nicobar Islands'),
      DropDownModel(id: '30', name: 'Chandigarh'),
      DropDownModel(id: '31', name: 'Dadra and Nagar Haveli and Daman and Diu'),
      DropDownModel(id: '32', name: 'Lakshadweep'),
      DropDownModel(id: '33', name: 'Delhi'),
      DropDownModel(id: '34', name: 'Puducherry'),
      DropDownModel(id: '35', name: 'Ladakh'),
      DropDownModel(id: '36', name: 'Jammu and Kashmir'),
    ];
  }
    // Method to handle state selection
  void onStateSelected(DropDownModel? state) {
    if (state == null) return;
    selectedState = state;
    update(); // Notify the UI
  }


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
