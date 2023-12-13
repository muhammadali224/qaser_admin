import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/items_controller/item_details_controller.dart';
import 'item_list_tile.dart';
import 'show_modal_weight_size_list.dart';

class WeightSizeTab extends GetView<ItemsDetailsController> {
  const WeightSizeTab({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return GetBuilder<ItemsDetailsController>(builder: (controller) {
      return RefreshIndicator(
        onRefresh: () => controller.getSubItem(),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.subItemsList.length,
            itemBuilder: (_, index) => Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: ItemDetailsListTile(
                onTap: () {
                  showWeightModalSheet(context, controller.subItemsList[index]);
                },
                title: controller.subItemsList[index].subItemNameAr!,
                subtitle:
                    "${controller.subItemsList[index].subItemsPrice.toString()} د",
                iconData: Icons.mode_edit_outline,
              ),
            ),
          ),
        ),
      );
    });
  }
}
