import 'package:get/get.dart';

enum DropDownMenu { asc, desc }

extension DropDownMenuExtension on DropDownMenu {
  String get name {
    switch (this) {
      case DropDownMenu.asc:
        return 'ASC';
      case DropDownMenu.desc:
        return 'DESC';
    }
  }
}

class DropdownButtonController extends GetxController {
  Rx<DropDownMenu> currentItem = DropDownMenu.asc.obs;

  void changeDropDownMenu(int? itemIndex) {
    var selectedItem =
        DropDownMenu.values.where((menu) => menu.index == itemIndex).first;
    currentItem(selectedItem);
  }
}
