import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/items_controller/item_details_controller.dart';
import '../../../../core/extension/space_extension.dart';
import '../../../../core/function/valid_input.dart';
import '../../../../data/model/sub_items/sub_items_model.dart';
import '../../../../data/source/shared/sub_item_weight_list.dart';
import '../../shred_component/input_form_field.dart';
import '../../shred_component/material_button.dart';

showWeightModalSheet(BuildContext context, [SubItemsModel? subItemsModel]) {
  ItemsDetailsController controller = Get.find<ItemsDetailsController>();
  if (subItemsModel != null) {
    controller.price.text = subItemsModel.subItemsPrice.toString();
  }
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
      children: [
        const Center(
            child: Text(
          "الاوزان والاصناف",
          style: TextStyle(fontSize: 22),
        )),
        20.height,
        Form(
          key: controller.formKey,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: DropdownMenu(
                    menuStyle: MenuStyle(
                        shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    )),
                    expandedInsets: const EdgeInsets.symmetric(horizontal: 5),
                    label: const Text("أختر الوزن او الحجم",
                        style: TextStyle(color: Colors.red)),
                    onSelected: (val) {
                      controller.selectedWeightAndSize = val!;
                    },
                    initialSelection: subItemsModel?.weightSizeId,
                    dropdownMenuEntries: subItemsList
                        .map((e) => DropdownMenuEntry(
                            value: e.weightSizeId, label: e.subItemNameAr!))
                        .toList(),
                  ),
                ),
                InputFormField(
                  hintTitle: 'السعر',
                  controller: controller.price,
                  keyboardType: const TextInputType.numberWithOptions(),
                  icon: Icons.price_change_outlined,
                  validate: (val) {
                    return validInput(val!, 1, 50, 'name');
                  },
                ),
              ],
            ),
          ),
        ),
        if (subItemsModel == null)
          MaterialCustomButton(
            onPressed: () => controller.addWeightSize(),
            title: 'add',
            color: Colors.green,
          ),
        if (subItemsModel != null)
          MaterialCustomButton(
            onPressed: () =>
                controller.editWeightSize(subItemsModel.subItemId!),
            title: 'edit',
            color: Colors.green,
          ),
        if (subItemsModel != null)
          MaterialCustomButton(
            onPressed: () =>
                controller.removeWeightSize(subItemsModel.subItemId!),
            title: 'delete',
            color: Colors.red,
          ),
      ],
    ),
  ).whenComplete(() => controller.price.clear());
}
