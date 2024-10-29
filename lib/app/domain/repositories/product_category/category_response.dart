

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:iitf_flutter_tab/app/core/failure/failure.dart';
import 'package:iitf_flutter_tab/app/data/app_url/product_category/category_url.dart';
import 'package:iitf_flutter_tab/app/data/model/api_model.dart';
import 'package:iitf_flutter_tab/app/data/model/product_category/category_model.dart';
import 'package:iitf_flutter_tab/app/data/network/network_api_services.dart';

class ProCategoryRepository {
  final _apiServices = NetworkApiServices();
//view
  Future<Either<Failure, CategoryModel>> getProCategoryList() async {
    try {
      dynamic response = await _apiServices.getApi(
      CategoryUrl.proCategoryListApi,
      );

      if (response != null && response["status"] == true) {
        CategoryModel res = CategoryModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //add
  Future<Either<Failure, ApiModel>> addProCategory(
    String name,
  ) async {
    try {
      var body = json.encode({
        "name": name,
      });
      dynamic response = await _apiServices
          .postApi(body, CategoryUrl.proCategoryAddApi, isJson: true);

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

  // //edit

  // Future<Either<Failure, ApiModel>> editProCategory({
  //   required String id,
  //   required String name,
  // }) async {
  //   try {
  //     var body = json.encode({
  //       "id": id,
  //       "name": name,
  //     });
  //     dynamic response = await _apiServices
  //         .putApi(body, CategoryUrl.proCategoryEditApi, isJson: true);

  //     if (response != null && response["status"] == true) {
  //       ApiModel res = ApiModel.fromJson(response);

  //       return Right(res);
  //     } else {
  //       return Left(Failure(response["message"].toString()));
  //     }
  //   } catch (e) {
  //     return Left(Failure(e.toString()));
  //   }
  // }

  // //delete
  // Future<Either<Failure, ApiModel>> deleteProCategory({
  //   required String id,
  // }) async {
  //   var body = {"id": id};
  //   try {
  //     dynamic response =
  //         await _apiServices.deleteApi(body, CategoryUrl.proCategoryDeleteApi);

  //     if (response != null && response["status"] == true) {
  //       ApiModel res = ApiModel.fromJson(response);

  //       return Right(res);
  //     } else {
  //       return Left(Failure(response["message"].toString()));
  //     }
  //   } catch (e) {
  //     return Left(Failure(e.toString()));
  //   }
  // }
}
