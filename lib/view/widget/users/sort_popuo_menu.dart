import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../controller/users_controller/view_users_controller.dart';

class SortPopUpMenu extends GetView<UsersViewController> {
  const SortPopUpMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      surfaceTintColor: Colors.white,
      elevation: 10,
      icon: const Icon(Icons.sort, color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (BuildContext context) {
        return [
          ...List.generate(
            controller.optionMenu.length,
            (index) => PopupMenuItem(
              value: controller.optionMenu[index].value,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(controller.optionMenu[index].name),
                  Icon(
                    controller.optionMenu[index].icon,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          )
        ];
      },
      onSelected: (value) {
        controller.selectOptionList(value);
      },
    );
  }
}
