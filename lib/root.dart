import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shopping_mall/screens/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const Login(),
        ),
      ],
    );
  }
}
