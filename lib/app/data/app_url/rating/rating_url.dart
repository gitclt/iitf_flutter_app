import 'package:iitf_flutter_tab/app/constants/strings.dart';

class RatingUrl {
  static String baseUrl = kBaseUrl;
  //add
  static String ratingAddApi = '$baseUrl/Rating/rating_add';

  static String ratingSyncApi = '$baseUrl/Rating/rating_add';

  static String enquirySyncApi = '$baseUrl/Enquiry/enquiry_add';

  static String feedbackListApi = '$baseUrl/Rating/get_ratings';
  static String enquiryListApi = '$baseUrl/Enquiry/enquiry_get';
}
