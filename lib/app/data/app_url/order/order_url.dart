import 'package:iitf_flutter_tab/app/constants/strings.dart';

class OrderUrl {
  static String baseUrl = kBaseUrl;

  //order

  static String orderListApi = '$baseUrl/Order/view_order';
 static String orderupdateStatusApi = '$baseUrl/Order/update_status';
  // static String orderEditApi = '$baseUrl/Product/edit_product';
  // static String orderDeleteApi = '$baseUrl/Product/Delete_product';
}
