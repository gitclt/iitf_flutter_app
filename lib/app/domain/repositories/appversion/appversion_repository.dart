import 'package:dartz/dartz.dart';
import 'package:iitf_flutter_tab/app/core/failure/failure.dart';
import 'package:iitf_flutter_tab/app/data/app_url/auth/auth_url.dart';
import 'package:iitf_flutter_tab/app/data/model/auth/app_version_model.dart';
import 'package:iitf_flutter_tab/app/data/network/network_api_services.dart';

class AppversionRepository {
  final _apiService = NetworkApiServices();

  Future<Either<Failure, AppversionModel>> getAppVersion() async {
    try {
      dynamic response = await _apiService.getApi(
        AppAuthUrl.appVersion,
      );

      if (response != null) {
        AppversionModel data = AppversionModel.fromJson(response.toList()[0]);

        return Right(data);
      } else {
        return Left(Failure('No Data'));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
