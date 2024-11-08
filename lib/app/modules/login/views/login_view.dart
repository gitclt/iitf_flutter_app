import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/common_widgets/button/common_button.dart';
import 'package:iitf_flutter_tab/app/common_widgets/textfeild/login_textfeild.dart';

import 'package:iitf_flutter_tab/app/core/assets/image_assets.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Form(
          // key: controller.formkey1,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.4,
                width: size.width * 0.6,
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
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  LoginTextFeild(
                    width: size.width * 1,
                    textController: controller.emailController.value,
                    label: 'username',
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  LoginTextFeild(
                    width: size.width * 1,
                    textController: controller.passwordController.value,
                    label: 'password',
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Obx(() => CommonButton(
                        isLoading: controller.isLoading.value,
                        onClick: () {
                          // if (controller.formkey1.currentState!.validate()) {
                          controller.login();
                          // }
                        },
                        label: 'login',
                      ))
                ],
              ).paddingSymmetric(horizontal: 30, vertical: 15),
            ],
          ),
        ),
      ),
    );
  }
}
