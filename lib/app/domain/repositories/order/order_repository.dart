import 'package:dartz/dartz.dart';
import 'package:iitf_flutter_tab/app/core/failure/failure.dart';
import 'package:iitf_flutter_tab/app/data/app_url/order/order_url.dart';
import 'package:iitf_flutter_tab/app/data/model/api_model.dart';
import 'package:iitf_flutter_tab/app/data/model/order/order_model.dart';
import 'package:iitf_flutter_tab/app/data/network/network_api_services.dart';

class OrderRepository {
  final _apiServices = NetworkApiServices();
//view
  Future<Either<Failure, OrderModel>> getOrderList(
      {required String stallid, status, page, pagesize}) async {
    try {
      dynamic response = await _apiServices.getApi(
        '${OrderUrl.orderListApi}?stall_id=$stallid&status=$status&page=$page&pageSize=$pagesize',
      );

      if (response != null && response["status"] == true) {
        OrderModel res = OrderModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }


  //update

  Future<Either<Failure, ApiModel>> updateStatus({
    required String id,
    required String status,
  }) async {
    try {
       var body = {"id": id,"status":status};
      dynamic response = await _apiServices
          .putApi(body, OrderUrl.orderupdateStatusApi,);

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

  // //add
  // Future<Either<Failure, ApiModel>> addOrder(
  //   String name,
  // ) async {
  //   try {
  //     var body = json.encode({
  //       "name": name,
  //     });
  //     dynamic response = await _apiServices
  //         .postApi(body, OrderUrl.orderAddApi, isJson: true);

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

  // //edit

  // Future<Either<Failure, ApiModel>> editOrder({
  //   required String id,
  //   required String name,
  // }) async {
  //   try {
  //     var body = json.encode({
  //       "id": id,
  //       "name": name,
  //     });
  //     dynamic response = await _apiServices
  //         .putApi(body, OrderUrl.orderEditApi, isJson: true);

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
  // Future<Either<Failure, ApiModel>> deleteOrder({
  //   required String id,
  // }) async {
  //   var body = {"id": id};
  //   try {
  //     dynamic response =
  //         await _apiServices.deleteApi(body, OrderUrl.orderDeleteApi);

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
