import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/data/local/user_preference/user_prefrence_view_model.dart';
import 'package:iitf_flutter_tab/app/data/network/network_api_services.dart';
import 'package:iitf_flutter_tab/app/domain/repositories/login/login_repository.dart';
import 'package:iitf_flutter_tab/app/domain/repositories/profile/profile_repository.dart';
import 'package:iitf_flutter_tab/app/routes/app_pages.dart';
import 'package:iitf_flutter_tab/app/utils/utils.dart';

class LoginController extends GetxController {
   final formkey1 = GlobalKey<FormState>();
  final _useapi = ProfileRepository();
  final emailController = TextEditingController(text: '').obs;
  final passwordController = TextEditingController(text: '').obs;
  final _api = LoginRepository();
  final apiServices = NetworkApiServices();
  UserPreference userPreference = UserPreference();
  final isLoading = false.obs;
  final isVisiblePassword = false.obs;
  final rememberMe = false.obs;
 

  void login() async {
    isLoading(true);
    // await fetchDeviceInfo();
    //  runLiveDb();

    try {
      String password =
          passwordController.value.text.trim().replaceAll('&', 'amp;');
      String temp =
          "username=${emailController.value.text.trim()}&password=$password";

      List<int> encDataByte =
          utf8.encode(temp); // Convert string to UTF-8 bytes
      String encodedData = base64Encode(encDataByte); // Encode bytes to Base64

      final response = await _api.loginApi(encodedData);

      response.fold((failure) {
        isLoading(false);
        Utils.snackBar('Login', failure.message);
      }, (sucess) async {
        if (sucess.data != null) {
           await userPreference.addToken(sucess.data ?? '');

          if (sucess.data != null) {
            final res =
                await _useapi.getProfileView(sucess.data!.toString());

            res.fold(
              (failure) {
                isLoading(false);
                Utils.snackBar('Profile', failure.message);
              },
              (resData) {
                if (resData.data != null) {
                  userPreference.saveUser(resData.data!).then(
                    (s) {
                      Get.rootDelegate.offNamed(Routes.home);
                    },
                  );
                }
              },
            );
          }
        }
      });
    } finally {
      isLoading(false);
    }
  }
}
