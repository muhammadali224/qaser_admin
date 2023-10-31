import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items_controller/add_edit_items_controller.dart';
import '../../../core/function/get_branch_name.dart';
import '../../../core/function/valid_input.dart';
import '../../../data/source/shared/branch_list.dart';
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
                  hintTitle: 'وصف المنتج بالعربي ',
                  controller: controller.descAr,
                  icon: Icons.description,
                  validate: (val) {
                    return validInput(val!, 5, 50, 'name');
                  },
                ),
                InputFormField(
                  hintTitle: 'وصف المنتج بالانجليزي ',
                  controller: controller.descEn,
                  icon: Icons.description_outlined,
                  validate: (val) {
                    return validInput(val!, 5, 50, 'name');
                  },
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
                    return validInput(val!, 3, 50, 'name');
                  },
                ),
                InputFormField(
                  hintTitle: 'النقاط مقابل الدينار للمنتج',
                  controller: controller.point,
                  keyboardType: const TextInputType.numberWithOptions(),
                  icon: Icons.redeem,
                  validate: (val) {
                    return validInput(val!, 3, 50, 'name');
                  },
                ),
                if (controller.isEdit)
                  ...List.generate(
                      branchList.length,
                      (index) => CheckboxListTile(
                            title: Text(
                              getBranchName(branchList[index].branchId!)!,
                              style: const TextStyle(color: Colors.black),
                            ),
                            value: controller.itemsModel!.branchIds?.contains(
                                branchList[index].branchId.toString()),
                            onChanged: (bool? value) {
                              // controller.editAvailableInBranch(
                              //     branchList[index].branchId!, value!);
                            },
                          )),
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