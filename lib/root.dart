import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shopping_mall/screens/home.dart';
import 'package:simple_shopping_mall/screens/home_add.dart';
import 'package:simple_shopping_mall/screens/login.dart';
import 'package:simple_shopping_mall/screens/profile.dart';

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
          page: () => Login(),
        ),
        GetPage(
          name: '/home',
          page: () => const Home(),
        ),
        GetPage(
          name: '/profile',
          page: () => Profile(),
        ),
        GetPage(
          name: '/homeAdd',
          page: () => const HomeAdd(),
        ),
      ],
    );
  }
}
