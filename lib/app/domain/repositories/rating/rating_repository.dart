import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:iitf_flutter_tab/app/core/failure/failure.dart';
import 'package:iitf_flutter_tab/app/data/app_url/rating/rating_url.dart';
import 'package:iitf_flutter_tab/app/data/model/api_model.dart';
import 'package:iitf_flutter_tab/app/data/network/network_api_services.dart';

class RatingRepository {
  final _apiServices = NetworkApiServices();
  //add
  Future<Either<Failure, ApiModel>> addRating(
      {String? name,
      String? stallid,
      String? ratingvalue,
      String? phone,
      String? discription}) async {
    try {
      var body = json.encode({
        "stall_id": stallid,
        "rating_value": ratingvalue,
        "name": name,
        "mobile": phone,
        "description": discription
      });
      dynamic response = await _apiServices
          .postApi(body, RatingUrl.ratingAddApi, isJson: true);

      if (response != null && response["status"] == true) {
        ApiModel res = ApiModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
