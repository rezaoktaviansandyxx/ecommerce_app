import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.blue,
      ),
    );

    loginContent() =>
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: Form(
              key: controller.formKey,
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, top: 27, right: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    25 /
                                    100),
                            TextFormField(
                              controller: controller.usernameController,
                              focusNode: controller.emailFocusNode,
                              autocorrect: false,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                labelText: 'Input Username',
                                border: inputBorder,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Username is required.';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20.0),
                            Obx(
                              () => TextFormField(
                                controller: controller.passwordController,
                                focusNode: controller.passwordFocusNode,
                                obscureText: controller.passwordObscure.value,
                                autocorrect: false,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  labelText: 'Input Password',
                                  border: inputBorder,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      controller.passwordObscure.value
                                          ? Icons.remove_red_eye_outlined
                                          : Icons.remove_red_eye,
                                    ),
                                    onPressed: () {
                                      controller.onObsecurePasswordTapped();
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password is required.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                                onPressed: () {
                                  controller.login(
                                    controller.usernameController.text,
                                    controller.passwordController.text,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(50)),
                                child: const Text("Login")),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          )
        ]);

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: loginContent()),
    );
  }
}
