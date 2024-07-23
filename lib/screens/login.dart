import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shopping_mall/widgets/button/login_button.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
            const LoginButton(
              logoColor: Color.fromARGB(255, 255, 154, 154),
              title: 'GOOGLE',
              backgroundColor: Color.fromARGB(255, 229, 115, 115),
              icon: Icon(
                Icons.g_mobiledata_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const LoginButton(
              logoColor: Colors.black,
              title: 'GUEST',
              backgroundColor: Color.fromRGBO(189, 189, 189, 1),
              icon: Icon(
                Icons.question_mark_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
