import 'package:ecommerce_app/routes/approutes.dart';
import 'package:ecommerce_app/services/api_services/api_services.dart';
import 'package:ecommerce_app/services/keys/get_storage_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/storage_service/storage_service.dart';

class LoginController extends GetxController {
  var storageService = Get.put(StorageService());
  var loginProvider = Get.put(LoginProvider());

  late TextEditingController usernameController;
  late TextEditingController passwordController;

  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;

  var formKey = GlobalKey<FormState>();

  var passwordObscure = true.obs;

  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void onClose() {
    super.onClose();
    clearTextFieldProp();
  }

  void login(String username, String password) async {
    if (formKey.currentState!.validate()) {
      try {
        var response = await loginProvider.auth(
          username: username,
          password: password,
        );
        if (response != null) {
          storageService.write(GetStorageKey.token, response);
          Get.offAllNamed(AppRoutes.homeScreen);
        } else {
          Get.snackbar("Error", "Invalid username or password");
        }
      } catch (err) {
        Future.error(err);
      }
    }
  }

  // Future<void> saveToken(response) async {
  //   storageService.write(GetStorageKey.token, response);
  // }

  void clearTextFieldProp() {
    usernameController.dispose();
    passwordController.dispose();
    emailFocusNode.unfocus();
    passwordFocusNode.unfocus();
  }

  void onObsecurePasswordTapped() {
    passwordObscure.toggle();
  }
}
