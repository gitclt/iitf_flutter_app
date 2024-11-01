import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/constants/strings.dart';
import 'package:iitf_flutter_tab/app/data/local/user_preference/user_prefrence_view_model.dart';
import 'package:iitf_flutter_tab/app/domain/repositories/appversion/appversion_repository.dart';
import 'package:iitf_flutter_tab/app/domain/repositories/profile/profile_repository.dart';
import 'package:iitf_flutter_tab/app/routes/app_pages.dart';
import 'package:iitf_flutter_tab/app/utils/utils.dart';

class RootController extends GetxController {
  final RxBool _isLoading = false.obs;
  final _api = ProfileRepository();
  final _appVersionapi = AppversionRepository();
  get isLoading => _isLoading.value;

  final RxBool _isAuthenticated = false.obs;

  get isAuthenticated => _isAuthenticated.value;
  UserPreference userPreference = UserPreference();
  @override
  void onInit() {
    checkAppVersion().then(
      (value) {
        if (value == true) {
          getLoginDetails();
        } else {
          Get.rootDelegate.offNamed(Routes.VERSION_CHECK);
          // Get.offAllNamed(Routes.APP_VERSION);
        }
      },
    );

    super.onInit();
  }

  Future<bool> checkAppVersion() async {
    // }
    _isLoading.value = true;
    bool status = true;
    final response = await _appVersionapi.getAppVersion();
    response.fold((failure) {}, (sucess) async {
      if (AppSettings().appVersionNo < int.parse(sucess.versionCode ?? '0')) {
        status = false;
      } else {
        status = true;
      }
    });

    return status;
  }

  getLoginDetails() async {
    // Utils.snackBar('root_', "Loading...................");

    _isLoading.value = true;
    Future.delayed(const Duration(seconds: 0)).then((value) async {
      final token = await userPreference.getUser();

      if (token != null) {
        final response = await _api.getProfileView(token);

        response.fold(
          (failure) {
            isLoading(false);
            Utils.snackBar('Profile', failure.message);
            gotoLogin();
          },
          (res) {
            if (res.data != null) {
              if (res.data != null) {
                userPreference
                    .saveUser(
                  res.data!,
                )
                    .then(
                  (s) {
                    if (LocalStorageKey.stallId.isNotEmpty) {
                      Get.rootDelegate.offNamed(Routes.home);
                    } else {
                      gotoLogin();
                      Utils.snackBar('User', "Permission denied ....");
                    }
                  },
                );
              }
            }
          },
        );
      } else {
        gotoLogin();
      }

      if (value != null) {}
    }).whenComplete(() => _isLoading.value = false);
  }

  void gotoLogin() async {
    UserPreference userPreference = UserPreference();
    await userPreference.removeUser();

    Get.rootDelegate.offNamed(Routes.login);
  }
}
