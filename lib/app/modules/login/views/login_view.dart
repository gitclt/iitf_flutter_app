import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/button/common_button.dart';
import 'package:iitf_flutter_tab/app/core/assets/image_assets.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
             key: controller.formkey1,
          child: Column(
                children: [
          SizedBox(
            height: 250,
            width: 250,
            child: Image.asset(
              ImageAssets.mainLogo,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 48),
              ).paddingSymmetric(horizontal: 20, vertical: 15),
              SizedBox(
                width: 800,
                height: 48,
                child: TextFormField(
                   validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Username';
                    }
                    return null;
                  },
                  controller: controller.emailController.value,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter username',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Color(0xFFDDDDDD), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Color(0xFFDDDDDD), width: 1),
                    ),
                  ),
                ),
              ).paddingSymmetric(horizontal: 20, vertical: 15),
              SizedBox(
                width: 800,
                height: 48,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter password';
                    }
                    return null;
                  },
                  controller: controller.passwordController.value,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Color(0xFFDDDDDD), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Color(0xFFDDDDDD), width: 1),
                    ),
                  ),
                ),
              ).paddingSymmetric(horizontal: 20, vertical: 15),
              Obx(
                () => CommonButton(
                  isLoading: controller.isLoading.value,
                  onClick: () {
                    if (controller.formkey1.currentState!.validate()) {
                      controller.login();
                     }
                  },
                  label: 'login'.tr,
                ).paddingSymmetric(horizontal: 20, vertical: 15),
              )
            ],
          ),
                ],
              ),
        ));
  }
}
