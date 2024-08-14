import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shopping_mall/controller/auth_controller.dart';
import 'package:simple_shopping_mall/controller/item_controller.dart';
import 'package:simple_shopping_mall/models/item.dart';

class HomeDetail extends StatelessWidget {
  final itemController = Get.put(ItemController());
  final AuthController authController = Get.find<AuthController>();

  final Item item;

  HomeDetail({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leadingWidth: 75,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Detail',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              itemController.deleteItems(item.id);
              Get.back();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        children: [
          Hero(
            tag: item.imageUrl,
            child: SizedBox(
              width: Get.width,
              height: 300,
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          SizedBox(
            width: 280,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 75, 113, 179),
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        GetBuilder<ItemController>(
                          init: ItemController(),
                          builder: (_) => IconButton(
                            onPressed: () {
                              final user = authController.user!;
                              itemController.toggleThumbsUp(item.id, user.uid);
                            },
                            icon: const Icon(
                              Icons.thumb_up,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        GetBuilder<ItemController>(
                          init: ItemController(),
                          builder: (_) => Text(
                            itemController.thumbsUpCount.toString(),
                            style: TextStyle(
                              color: Colors.red[200],
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  item.price,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 102, 136, 194),
                    fontSize: 23,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  height: 1,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  item.description,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 102, 136, 194),
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'creator : ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: item.id,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: item.createdAt.toDate().toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      const TextSpan(
                        text: ' Created',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: item.updatedAt.toDate().toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      const TextSpan(
                        text: ' Modified',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
