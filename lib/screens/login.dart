import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shopping_mall/controller/auth_controller.dart';
import 'package:simple_shopping_mall/widgets/button/login_button.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 120,
                bottom: 70,
              ),
              child: Image(
                image: const AssetImage('assets/images/shoppingcart.png'),
                height: 150,
                width: Get.width,
              ),
            ),
            Obx(
              () {
                if (authController.isGoogleLoading.value) {
                  return const CircularProgressIndicator();
                } else {
                  return LoginButton(
                    logoColor: const Color.fromARGB(255, 255, 154, 154),
                    title: 'GOOGLE',
                    backgroundColor: const Color.fromARGB(255, 229, 115, 115),
                    icon: const Icon(
                      Icons.g_mobiledata_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    onClickEvent: () {
                      authController.loginWithGoogle();
                    },
                  );
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () {
                if (authController.isAnonymousLoading.value) {
                  return const CircularProgressIndicator();
                } else {
                  return LoginButton(
                    logoColor: Colors.black,
                    title: 'GUEST',
                    backgroundColor: const Color.fromRGBO(189, 189, 189, 1),
                    icon: const Icon(
                      Icons.question_mark_rounded,
                      color: Colors.white,
                    ),
                    onClickEvent: () {
                      authController.loginWithAnonymous();
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
