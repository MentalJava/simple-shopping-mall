import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shopping_mall/controller/item_controller.dart';
import 'package:simple_shopping_mall/models/item.dart';

class DetailModified extends StatelessWidget {
  final itemController = Get.put(ItemController());

  final Item item;

  DetailModified({
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
        leading: TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'Cancle',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        title: const Text(
          'Edit',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () async {
              await itemController.updateItem(
                item.id,
                item.name,
                item.description,
                item.price,
                item.imageUrl,
              );
              Get.back();
            },
            child: const Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () {
                    return itemController.image.value == null
                        ? SizedBox(
                            height: 300,
                            width: Get.width,
                            child: Image.network(
                              item.imageUrl,
                              width: Get.width,
                              height: Get.height,
                              fit: BoxFit.fill,
                            ),
                          )
                        : SizedBox(
                            height: 300,
                            width: Get.width,
                            child: Image.file(
                              itemController.image.value!,
                              width: Get.width,
                              height: Get.height,
                              fit: BoxFit.fill,
                            ),
                          );
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.photo_camera,
                      color: Colors.black,
                    ),
                    onPressed: () async {
                      await itemController.pickImage();
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: TextFormField(
                    initialValue: item.name,
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    decoration: const InputDecoration(
                      hintText: 'Product Name',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 75, 113, 179),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 61, 111, 197),
                          width: 2.5,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      item.name = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 300,
                  child: TextFormField(
                    initialValue: item.price,
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    decoration: const InputDecoration(
                      hintText: 'Price',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 102, 136, 194),
                        fontSize: 17,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(189, 189, 189, 0.5),
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      item.price = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  width: 300,
                  child: TextFormField(
                    initialValue: item.description,
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    decoration: const InputDecoration(
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 102, 136, 194),
                        fontSize: 17,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(189, 189, 189, 0.5),
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      item.description = value;
                    },
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () {
              if (itemController.isLoading.value) {
                return Stack(
                  children: [
                    Container(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }
}
