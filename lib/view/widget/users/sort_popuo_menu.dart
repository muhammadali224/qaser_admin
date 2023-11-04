import 'package:flutter/material.dart';

import '../../../data/model/pop_menu_model/pop_menu_model.dart';

class SortPopUpMenu extends StatelessWidget {
  final List<PopMenuModel> optionMenu;
  final Function(String)? onSelected;
  final Widget? icon;

  const SortPopUpMenu(
      {super.key, required this.optionMenu, this.onSelected, this.icon});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      surfaceTintColor: Colors.white,
      elevation: 10,
      icon: icon ?? const Icon(Icons.sort, color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (BuildContext context) {
        return [
          ...List.generate(
            optionMenu.length,
            (index) => PopupMenuItem(
              value: optionMenu[index].value,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(optionMenu[index].name),
                  Icon(
                    optionMenu[index].icon,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          )
        ];
      },
      onSelected: onSelected,
    );
  }
}
