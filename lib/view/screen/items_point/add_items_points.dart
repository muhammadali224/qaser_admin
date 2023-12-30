import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items_point_controller/items_point_controller.dart';
import '../../../core/extension/date_extension.dart';
import '../../../core/function/pick_date.dart';
import '../../../core/function/valid_input.dart';
import '../../widget/items_point/items_point_image_header.dart';
import '../../widget/shred_component/input_form_field.dart';
import '../../widget/shred_component/material_button.dart';
import '../../widget/shred_component/padding_container.dart';

class AddItemsPoint extends StatelessWidget {
  const AddItemsPoint({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddItemsPointController());
    return Scaffold(
      appBar: AppBar(title: Text('addCategories'.tr)),
      body: PaddingContainer(
        child: GetBuilder<AddItemsPointController>(builder: (controller) {
          return Form(
            key: controller.formKey,
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              shrinkWrap: true,
              children: [
                const ItemsPointImageHeader(),
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
                  hintTitle: 'سعر المنتج بالنقاط ',
                  controller: controller.price,
                  keyboardType: const TextInputType.numberWithOptions(),
                  icon: Icons.description,
                ),
                InputFormField(
                  hintTitle: 'عدد المنتج',
                  keyboardType: TextInputType.number,
                  controller: controller.count,
                  icon: Icons.description_outlined,
                ),
                InputFormField(
                  hintTitle: 'تاريخ البدء',
                  controller: controller.startDate,
                  onTap: () async {
                    controller.startDate.text =
                        (await pickDate(context))!.parseDate();
                    controller.update();
                  },
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  icon: Icons.numbers_outlined,
                  validate: (val) {
                    return validInput(val!, 1, 50, 'name');
                  },
                ),
                InputFormField(
                  hintTitle: 'تاريخ الانتهاء',
                  onTap: () async {
                    controller.endDate.text =
                        (await pickDate(context))!.parseDate();
                    controller.update();
                  },
                  readOnly: true,
                  controller: controller.endDate,
                  keyboardType: const TextInputType.numberWithOptions(),
                  icon: Icons.price_change_outlined,
                  validate: (val) {
                    return validInput(val!, 1, 50, 'name');
                  },
                ),
                MaterialCustomButton(
                  onPressed: () => controller.addItemWithImage(),
                  title: 'add',
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
