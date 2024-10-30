import 'package:iitf_flutter_tab/app/constants/strings.dart';

class ProductUrl {
   static String baseUrl = kBaseUrl;

   //product
   
  static String productListApi = '$baseUrl/Product/view_product';
  static String productAddApi = '$baseUrl/Product/add_product';
  static String productEditApi = '$baseUrl/Product/edit_product';
  static String procuctDeleteApi = '$baseUrl/Product/Delete_product';
}