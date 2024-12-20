import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:iitf_flutter_tab/app/core/failure/failure.dart';
import 'package:iitf_flutter_tab/app/data/app_url/product/product_url.dart';
import 'package:iitf_flutter_tab/app/data/model/api_model.dart';
import 'package:iitf_flutter_tab/app/data/model/product/product_model.dart';
import 'package:iitf_flutter_tab/app/data/network/network_api_services.dart';

class ProductRepository {
  final _apiServices = NetworkApiServices();
//view
  Future<Either<Failure, ProductModel>> getProductList({required String stallid}) async {
    try {
      dynamic response = await _apiServices.getApi(
        '${ProductUrl.productListApi}?stall_id=$stallid',
      );

      if (response != null && response["status"] == true) {
        ProductModel res = ProductModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //add
  Future<Either<Failure, ApiModel>> addProduct(
      {String? name,
      int? cadId,
      String? code,
      String? image,
      String? price,
      String? offerPrice,
      String? stallid,
      String? description,
      String? visible,
      String? imagedata}) async {
    try {
      var body = json.encode({
        "name": name,
        "cat_id": cadId,
        "code": code,
        if (image != '') "image": image,
        "price": price,
        "offer_price": offerPrice,
        "stall_id": stallid,
        "description": description,
        "visibility": visible,
        if (imagedata != null) "image_data": imagedata
      });

      dynamic response = await _apiServices
          .postApi(body, ProductUrl.productAddApi, isJson: true);

      if (response != null && response["status"] == true) {
        ApiModel res = ApiModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      print(e);
      return Left(Failure(e.toString()));
    }
  }

  //edit

  Future<Either<Failure, ApiModel>> editProduct({
    required String id,
    String? name,
    int? cadId,
    String? code,
    String? image,
    String? price,
    String? offerPrice,
    String? stallid,
    String? description,
    String? visible,
    String? imagedata,
    String? oldImg,
    required String isImgChed,
  }) async {
    try {
      var body = json.encode({
        "id": id,
        "name": name,
        "cat_id": cadId,
        "code": code,
        if (image != '') "image": image,
        "price": price,
        "offer_price": offerPrice,
        "stall_id": stallid,
        "description": description,
        "visibility": visible,
        "is_img_chged": isImgChed,
        "img_oldname": oldImg ?? '',
        if (imagedata != null) "image_data": imagedata
      });
      dynamic response = await _apiServices
          .putApi(body, ProductUrl.productEditApi, isJson: true);

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

  //delete
  Future<Either<Failure, ApiModel>> deleteProduct({
    required String id,
  }) async {
    var body = {"id": id};
    try {
      dynamic response =
          await _apiServices.deleteApi(body, ProductUrl.procuctDeleteApi);

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
