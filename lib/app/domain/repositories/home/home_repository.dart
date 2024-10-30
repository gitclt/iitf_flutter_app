import 'package:dartz/dartz.dart';
import 'package:iitf_flutter_tab/app/core/failure/failure.dart';
import 'package:iitf_flutter_tab/app/data/app_url/home/home_url.dart';
import 'package:iitf_flutter_tab/app/data/model/home/home_model.dart';
import 'package:iitf_flutter_tab/app/data/network/network_api_services.dart';

class HomeRepository {
    final _apiServices = NetworkApiServices();
  //view
  Future<Either<Failure, HomeModel>> getCountList({required String stallid}) async {
    try {
      dynamic response = await _apiServices.getApi(
        '${HomeUrl.countViewApi}?stall_id=$stallid',
      );

      if (response != null && response["status"] == true) {
        HomeModel  res = HomeModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}