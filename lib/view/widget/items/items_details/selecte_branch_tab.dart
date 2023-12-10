import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/items_controller/item_details_controller.dart';
import '../../../../data/model/branch_model/branch_model.dart';
import '../../../../data/source/shared/branch_list.dart';
import 'item_list_tile.dart';

class SelectBranchTab extends GetView<ItemsDetailsController> {
  const SelectBranchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsDetailsController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.itemModel!.branchIds!.length,
          itemBuilder: (_, index) {
            for (BranchModel element in branchList) {
              if (element.branchId ==
                  int.parse(controller.itemModel!.branchIds![index])) {
                return ItemDetailsListTile(
                  title: element.branchNameAr!,
                  onTap: () {
                    controller.editAvailableInBranch(
                        int.parse(controller.itemModel!.branchIds![index]),
                        false);
                  },
                );
              }
            }
            return Container();
          },
        ),
      );
    });
  }
}
