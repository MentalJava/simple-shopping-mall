import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shopping_mall/controller/item_controller.dart';
import 'package:simple_shopping_mall/models/item.dart';
import 'package:simple_shopping_mall/widgets/item_grid_list.dart';

class Home extends StatelessWidget {
  final itemController = Get.put(ItemController());
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            Get.toNamed('/profile');
          },
        ),
        title: const Text(
          'Main',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Get.toNamed('/homeAdd');
            },
          ),
        ],
      ),
      body: StreamBuilder<List<Item>>(
        stream: itemController.getItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No Items'),
            );
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Item item = snapshot.data![index];
              return ItemGridList(item: item);
            },
          );
        },
      ),
    );
  }
}
