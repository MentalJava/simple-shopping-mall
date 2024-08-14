import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shopping_mall/controller/auth_controller.dart';

class Profile extends StatelessWidget {
  final authController = Get.put(AuthController());
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app_rounded),
            onPressed: () async {
              await authController.logOut();
            },
          ),
        ],
      ),
      body: Obx(
        () {
          if (authController.user == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final user = authController.user!;
            return Center(
              child: SizedBox(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 300,
                      child: Image.network(user.photoURL ??
                          'https://i.pinimg.com/564x/2c/61/15/2c6115b5f876df7c0782b7eabd58e794.jpg'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "<${user.uid}>",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      thickness: 1,
                      height: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      user.email ?? 'Anonymous',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
