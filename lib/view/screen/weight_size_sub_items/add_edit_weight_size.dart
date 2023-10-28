import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../controller/weight_size_controller/add_edit_weight_size_controller.dart';
import '../../../core/function/valid_input.dart';
import '../../widget/shred_component/input_form_field.dart';
import '../../widget/shred_component/material_button.dart';
import '../../widget/shred_component/padding_container.dart';

class AddEditWeightSize extends StatelessWidget {
  const AddEditWeightSize({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddEditWeightSizeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('addWeightSize'.tr),
      ),
      body: PaddingContainer(
        child: GetBuilder<AddEditWeightSizeController>(builder: (controller) {
          return Form(
            key: controller.formKey,
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              shrinkWrap: true,
              children: [
                InputFormField(
                  hintTitle: 'الاسم بالعربي',
                  controller: controller.nameAr,
                  icon: Icons.account_circle_outlined,
                  validate: (val) {
                    return validInput(val!, 4, 50, 'name');
                  },
                ),
                InputFormField(
                  hintTitle: 'الاسم بالانجليزي',
                  icon: Icons.translate,
                  controller: controller.nameEn,
                  iconColor: Colors.purple,
                  validate: (val) {
                    return validInput(val!, 4, 50, 'name');
                  },
                ),
                InputFormField(
                  hintTitle: 'القيمة 0.0',
                  controller: controller.val,
                  keyboardType: const TextInputType.numberWithOptions(),
                  icon: FontAwesome.weight_scale,
                  validate: (val) {
                    return validInput(val!, 1, 15, 'password');
                  },
                ),
                MaterialCustomButton(
                  onPressed: () => controller.isEdit
                      ? controller.editSubItem()
                      : controller.addWeightSize(),
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
