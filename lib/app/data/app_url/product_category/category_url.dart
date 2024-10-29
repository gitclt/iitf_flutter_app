import 'package:iitf_flutter_tab/app/constants/strings.dart';

class CategoryUrl {
  static String baseUrl = kBaseUrl;
  //category
  //productcategory
  static String proCategoryListApi = '$baseUrl/Procategory/Getcategory';
  static String proCategoryAddApi = '$baseUrl/Procategory/Postcategory';
  static String proCategoryEditApi = '$baseUrl/Procategory/Updatecategory';
  static String proCategoryDeleteApi = '$baseUrl/Procategory/Deletecategory';
}
