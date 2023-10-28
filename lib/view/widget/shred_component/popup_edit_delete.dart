import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/pop_menu_model/pop_menu_model.dart';

class PopMenuEditDelete extends StatelessWidget {
  final void Function() onEditTap;
  final void Function() onDeleteTap;
  final List<PopMenuModel>? popModels;

  const PopMenuEditDelete(
      {super.key,
      required this.onEditTap,
      required this.onDeleteTap,
      this.popModels});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      surfaceTintColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 'edit',
            child: Text("edit".tr),
          ),
          PopupMenuItem(
            value: 'delete',
            child: Text("delete".tr),
          ),
          if (popModels != null && popModels!.isNotEmpty)
            ...List.generate(
              popModels!.length,
              (index) => PopupMenuItem(
                value: popModels![index].value,
                child: Text(popModels![index].name.tr),
              ),
            )
        ];
      },
      onSelected: (value) {
        if (value == "edit") {
          onEditTap();
        }
        if (value == "delete") {
          onDeleteTap();
        }
      },
    );
  }
}
