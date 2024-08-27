import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shopping_mall/controller/dropdown_button_controller.dart';

class CustomDropdownButton extends StatelessWidget {
  final dropController = Get.put(DropdownButtonController());
  CustomDropdownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton(
          value: dropController.currentItem.value.index,
          items: DropDownMenu.values
              .map(
                (menu) => DropdownMenuItem(
                  value: menu.index,
                  child: Text(menu.name),
                ),
              )
              .toList(),
          onChanged: (value) {
            dropController.changeDropDownMenu(value);
          },
        ),
      ),
    );
  }
}
