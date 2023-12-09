import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/items_controller/item_details_controller.dart';
import '../../../../data/model/branch_model/branch_model.dart';
import '../../../../data/source/shared/branch_list.dart';

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
                return ListTile(
                  onTap: () {
                    controller.editAvailableInBranch(
                        int.parse(controller.itemModel!.branchIds![index]),
                        false);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  tileColor: Colors.red.withOpacity(0.2),
                  title: Text(element.branchNameAr!),
                  trailing: const Icon(
                    Icons.remove_circle,
                    color: Colors.red,
                  ),
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
