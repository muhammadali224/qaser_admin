import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items_controller/add_edit_items_controller.dart';
import '../../../core/function/valid_input.dart';
import '../../../data/source/shared/sub_item_weight_list.dart';
import '../../widget/items/item_image_header.dart';
import '../../widget/shred_component/input_form_field.dart';
import '../../widget/shred_component/material_button.dart';
import '../../widget/shred_component/padding_container.dart';

class AddEditItems extends StatelessWidget {
  const AddEditItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddEditItemsController());
    return Scaffold(
      appBar: AppBar(title: Text('addCategories'.tr)),
      body: PaddingContainer(
        child: GetBuilder<AddEditItemsController>(builder: (controller) {
          return Form(
            key: controller.formKey,
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              shrinkWrap: true,
              children: [
                const ItemImageHeader(),
                const SizedBox(height: 20),
                InputFormField(
                  hintTitle: 'اسم المنتج بالعربي ',
                  controller: controller.nameAr,
                  icon: Icons.account_circle_outlined,
                  validate: (val) {
                    return validInput(val!, 3, 50, 'name');
                  },
                ),
                InputFormField(
                  hintTitle: 'اسم المنتج بالانجليزي ',
                  controller: controller.nameEn,
                  icon: Icons.translate,
                  validate: (val) {
                    return validInput(val!, 3, 50, 'name');
                  },
                ),
                InputFormField(
                  isExpanded: true,
                  hintTitle: 'وصف المنتج بالعربي ',
                  controller: controller.descAr,
                  icon: Icons.description,
                ),
                InputFormField(
                  isExpanded: true,
                  hintTitle: 'وصف المنتج بالانجليزي ',
                  controller: controller.descEn,
                  icon: Icons.description_outlined,
                ),
                InputFormField(
                  hintTitle: 'عدد المنتج',
                  controller: controller.count,
                  keyboardType: TextInputType.number,
                  icon: Icons.numbers_outlined,
                  validate: (val) {
                    return validInput(val!, 1, 50, 'name');
                  },
                ),
                InputFormField(
                  hintTitle: 'سعر المنتج',
                  controller: controller.price,
                  keyboardType: const TextInputType.numberWithOptions(),
                  icon: Icons.price_change_outlined,
                  validate: (val) {
                    return validInput(val!, 1, 50, 'name');
                  },
                ),
                InputFormField(
                  hintTitle: 'الخصم المنتج',
                  controller: controller.discount,
                  keyboardType: const TextInputType.numberWithOptions(),
                  icon: Icons.percent_rounded,
                  validate: (val) {
                    return validInput(val!, 1, 50, 'name');
                  },
                ),
                InputFormField(
                  hintTitle: 'النقاط مقابل الدينار للمنتج',
                  controller: controller.point,
                  keyboardType: const TextInputType.numberWithOptions(),
                  icon: Icons.redeem,
                  validate: (val) {
                    return validInput(val!, 1, 50, 'name');
                  },
                ),
                InputFormField(
                  hintTitle: 'المجموعة الخاصة للمنتج',
                  controller: controller.itemGroup,
                  keyboardType: TextInputType.number,
                  icon: Icons.group_work,
                  validate: (val) {
                    return validInput(val!, 1, 50, 'name');
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: DropdownMenu(
                    trailingIcon: const Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: Colors.red),
                    expandedInsets: const EdgeInsets.symmetric(horizontal: 5),
                    label: const Text("أختر الوزن او الحجم الافتراضي",
                        style: TextStyle(color: Colors.red)),
                    onSelected: (val) {
                      controller.selectedWeightAndSize = val!;
                    },
                    initialSelection: controller.isEdit
                        ? controller.selectedWeightAndSize
                        : null,
                    dropdownMenuEntries: subItemsList
                        .map((e) => DropdownMenuEntry(
                            value: e.weightSizeId, label: e.subItemNameAr!))
                        .toList(),
                  ),
                ),
                MaterialCustomButton(
                  onPressed: () => controller.isEdit
                      ? controller.editItem()
                      : controller.addItemWithImage(),
                  title: controller.isEdit ? 'edit' : 'add',
                  color: Colors.red,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
