import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shopping_mall/models/item.dart';

class HomeDetail extends StatelessWidget {
  final Item item;
  const HomeDetail({
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
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
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
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.thumb_up,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                            color: Colors.red[200],
                            fontSize: 20,
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
                  height: 20,
                ),
                const Divider(
                  height: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  item.description,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 102, 136, 194),
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 90,
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
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '24.08.05 17:41:00 ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: 'Created',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '24.08.05 17:41:00 ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: 'Modified',
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
