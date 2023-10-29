import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/categories_controller/add_edit_categories_controller.dart';
import '../../../core/function/valid_input.dart';
import '../../widget/categories/category_image_header.dart';
import '../../widget/shred_component/input_form_field.dart';
import '../../widget/shred_component/material_button.dart';
import '../../widget/shred_component/padding_container.dart';

class AddEditCategories extends StatelessWidget {
  const AddEditCategories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddEditCategoryController());
    return Scaffold(
      appBar: AppBar(title: Text('addCategories'.tr)),
      body: PaddingContainer(
        child: GetBuilder<AddEditCategoryController>(builder: (controller) {
          return Form(
            key: controller.formKey,
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              shrinkWrap: true,
              children: [
                const CategoryImageHeader(),
                const SizedBox(height: 20),
                InputFormField(
                  hintTitle: 'الاسم بالعربي ',
                  controller: controller.nameAr,
                  icon: Icons.account_circle_outlined,
                  validate: (val) {
                    return validInput(val!, 3, 50, 'name');
                  },
                ),
                InputFormField(
                  hintTitle: 'الاسم بالانجليزي ',
                  icon: Icons.translate,
                  controller: controller.nameEn,
                  iconColor: Colors.purple,
                  validate: (val) {
                    return validInput(val!, 3, 50, 'name');
                  },
                ),
                MaterialCustomButton(
                  onPressed: () => controller.isEdit
                      ? controller.editCategory()
                      : controller.uploadImage(),
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
