import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:iitf_flutter_tab/app/core/failure/failure.dart';
import 'package:iitf_flutter_tab/app/data/app_url/rating/rating_url.dart';
import 'package:iitf_flutter_tab/app/data/model/api_model.dart';
import 'package:iitf_flutter_tab/app/data/model/enquiry/add_enquiry_model.dart';
import 'package:iitf_flutter_tab/app/data/model/enquiry/enquiry_model.dart';
import 'package:iitf_flutter_tab/app/data/model/rating/feedback_model.dart';
import 'package:iitf_flutter_tab/app/data/model/rating/rating_add_model.dart';
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

  Future<Either<Failure, ApiModel>> syncRating(
      {required List<RatingAddModel> data}) async {
    try {
      var body = json.encode(data);
      dynamic response = await _apiServices
          .postApi(body, RatingUrl.ratingSyncApi, isJson: true);

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

  Future<Either<Failure, ApiModel>> syncEnq(
      {required List<EnqAddModel> data}) async {
    try {
      var body = json.encode(data);
      dynamic response = await _apiServices
          .postApi(body, RatingUrl.enquirySyncApi, isJson: true);

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

  Future<Either<Failure, FeedbackModel>> getFeedback(String stallId) async {
    try {
      dynamic response = await _apiServices
          .getApi("${RatingUrl.feedbackListApi}?stall_id=$stallId");

      if (response != null && response["status"] == true) {
        FeedbackModel res = FeedbackModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, EnquiryModel>> getEnquiry(String stallId) async {
    try {
      dynamic response = await _apiServices
          .getApi("${RatingUrl.enquiryListApi}?stall_id=$stallId");

      if (response != null && response["status"] == true) {
        EnquiryModel res = EnquiryModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
