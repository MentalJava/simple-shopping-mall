import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shopping_mall/controller/dropdown_button_controller.dart';

class CustomDropdownButton extends StatelessWidget {
  final dynamic value;
  final Function(int) onChangedEvent;
  const CustomDropdownButton({
    super.key,
    required this.value,
    required this.onChangedEvent,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DropdownButtonController>(
      init: DropdownButtonController(),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton(
          value: value,
          items: DropDownMenu.values
              .map(
                (menu) => DropdownMenuItem(
                  value: menu.index,
                  child: Text(menu.name),
                ),
              )
              .toList(),
          onChanged: (value) {
            onChangedEvent(value as int);
          },
        ),
      ),
    );
  }
}
