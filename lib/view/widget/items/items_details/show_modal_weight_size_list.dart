import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/items_controller/item_details_controller.dart';
import '../../../../core/extension/space_extension.dart';
import '../../../../core/function/valid_input.dart';
import '../../../../data/model/sub_items/sub_items_model.dart';
import '../../shred_component/input_form_field.dart';
import '../../shred_component/material_button.dart';

showWeightModalSheet(BuildContext context, {SubItemsModel? subModel}) {
  ItemsDetailsController controller = Get.find<ItemsDetailsController>();
  if (subModel != null) {
    controller.nameAr.text = subModel.subItemsNameAr!;
    controller.nameEn.text = subModel.subItemsName!;
    controller.price.text = subModel.subItemsPrice.toString();
    controller.discount.text = subModel.subItemsDiscount.toString();
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
                InputFormField(
                  hintTitle: 'الاسم بالعربي',
                  controller: controller.nameAr,
                  icon: Icons.price_change_outlined,
                  validate: (val) {
                    return validInput(val!, 1, 50, 'name');
                  },
                ),
                InputFormField(
                  hintTitle: 'الاسم بالانجليزي',
                  controller: controller.nameEn,
                  icon: Icons.price_change_outlined,
                  validate: (val) {
                    return validInput(val!, 1, 50, 'name');
                  },
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
                InputFormField(
                  hintTitle: 'الخصم',
                  controller: controller.discount,
                  keyboardType: const TextInputType.numberWithOptions(),
                  icon: Icons.percent,
                  validate: (val) {
                    return validInput(val!, 1, 50, 'name');
                  },
                ),
              ],
            ),
          ),
        ),
        if (subModel == null)
          MaterialCustomButton(
            onPressed: controller.addSubItem,
            title: 'add',
            color: Colors.green,
          ),
        if (subModel != null) ...[
          MaterialCustomButton(
            onPressed: () => controller.editWeightSize(subModel.subItemId!),
            title: 'edit',
            color: Colors.green,
          ),
          MaterialCustomButton(
            onPressed: () => controller.removeWeightSize(subModel.subItemId!),
            title: 'delete',
            color: Colors.red,
          ),
        ]
      ],
    ),
  ).whenComplete(() {
    controller.price.clear();
    controller.nameAr.clear();
    controller.nameEn.clear();
    controller.discount.clear();
  });
}
