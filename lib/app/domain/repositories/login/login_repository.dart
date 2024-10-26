
import 'package:dartz/dartz.dart';
import 'package:iitf_flutter_tab/app/core/failure/failure.dart';
import 'package:iitf_flutter_tab/app/data/app_url/auth/auth_url.dart';
import 'package:iitf_flutter_tab/app/data/model/auth/auth_model.dart';
import 'package:iitf_flutter_tab/app/data/network/network_api_services.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<Either<Failure, AuthModel>> loginApi(var data) async {
    try {
      var formData = {
        "data": data,
      };
      dynamic response = await _apiService.loginApi(
        formData,
        AppAuthUrl.login,
      );

      if (response != null && response["status"] == true) {
        AuthModel user = AuthModel.fromJson(response);

        return Right(user);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
