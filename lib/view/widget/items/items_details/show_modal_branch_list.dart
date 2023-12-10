import 'package:flutter/material.dart';

import '../../../../core/extension/space_extension.dart';
import '../../../../data/source/shared/branch_list.dart';
import 'item_list_tile.dart';

showCustomModalSheet(BuildContext context, Function(int, bool) onTap) {
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    elevation: 15,
    isScrollControlled: true,
    useSafeArea: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(15), right: Radius.circular(15))),
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Center(
            child: Text(
          "الفروع",
          style: TextStyle(fontSize: 22),
        )),
        20.height,
        Column(
          mainAxisSize: MainAxisSize.min,
          children: branchList
              .map((e) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ItemDetailsListTile(
                    onTap: () {
                      onTap(e.branchId!, true);
                    },
                    title: e.branchNameAr!,
                    iconData: Icons.add_circle,
                    color: Colors.green,
                  )))
              .toList(),
        ),
        20.height,
      ],
    ),
  );
}
