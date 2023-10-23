import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopMenuEditDelete extends StatelessWidget {
  final void Function() onEditTap;
  final void Function() onDeleteTap;

  const PopMenuEditDelete(
      {super.key, required this.onEditTap, required this.onDeleteTap});

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
