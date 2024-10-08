import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shopping_mall/controller/dropdown_button_controller.dart';
import 'package:simple_shopping_mall/controller/item_controller.dart';
import 'package:simple_shopping_mall/models/item.dart';
import 'package:simple_shopping_mall/widgets/button/custom_dropdown_button.dart';
import 'package:simple_shopping_mall/widgets/item/item_grid_list.dart';

class Home extends StatelessWidget {
  final itemController = Get.put(ItemController());
  final dropController = Get.put(DropdownButtonController());

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
      body: Column(
        children: [
          GetBuilder<DropdownButtonController>(
            init: DropdownButtonController(),
            builder: (_) => CustomDropdownButton(
              value: dropController.currentItem.value.index,
              onChangedEvent: (value) {
                dropController.changeDropDownMenu(value);
              },
            ),
          ),
          Expanded(
            child: Obx(
              () {
                if (itemController.items.isEmpty) {
                  return const Center(
                    child: Text('No Items'),
                  );
                }
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: itemController.items.length,
                  itemBuilder: (context, index) {
                    Item item = itemController.items[index];
                    return ItemGridList(item: item);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
