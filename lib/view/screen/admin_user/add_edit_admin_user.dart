import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../controller/admin_user_controller/add_edit_admin_user_controller.dart';
import '../../../core/function/valid_input.dart';
import '../../widget/shred_component/input_form_field.dart';
import '../../widget/shred_component/material_button.dart';
import '../../widget/shred_component/padding_container.dart';

class AddEditAdminUser extends StatelessWidget {
  const AddEditAdminUser({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddEditAdminUserController());
    return Scaffold(
      appBar: AppBar(
        title: Text('addBranch'.tr),
      ),
      body: PaddingContainer(
        child: GetBuilder<AddEditAdminUserController>(builder: (controller) {
          return Form(
            key: controller.formKey,
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              shrinkWrap: true,
              children: [
                InputFormField(
                  hintTitle: 'إسم بالعربي',
                  controller: controller.nameAr,
                  icon: Icons.account_circle_outlined,
                  validate: (val) {
                    return validInput(val!, 4, 50, 'name');
                  },
                ),
                InputFormField(
                  hintTitle: 'البريد الالكتروني',
                  icon: Icons.abc,
                  controller: controller.email,
                  iconColor: Colors.purple,
                  validate: (val) {
                    return validInput(val!, 4, 50, 'email');
                  },
                ),
                InputFormField(
                  hintTitle: 'الرقم السري',
                  controller: controller.password,
                  keyboardType: TextInputType.phone,
                  icon: FontAwesome.lock,
                  validate: (val) {
                    return validInput(val!, 10, 15, 'phone');
                  },
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      const Text("سوبر أدمن :", style: TextStyle(fontSize: 18)),
                      Expanded(
                        child: RadioListTile<int>(
                          title: Text("yes".tr),
                          value: 1,
                          groupValue: controller.isSuperAdmin,
                          onChanged: controller.onChanged,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<int>(
                          title: Text("no".tr),
                          value: 0,
                          groupValue: controller.isSuperAdmin,
                          onChanged: controller.onChanged,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialCustomButton(
                  onPressed: () => controller.isEdit
                      ? controller.editAdminsUser()
                      : controller.addAdminUser(),
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
