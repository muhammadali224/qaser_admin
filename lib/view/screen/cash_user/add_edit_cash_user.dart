import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../controller/cash_user_controller/add_edit_cash_user_controller.dart';
import '../../../core/function/valid_input.dart';
import '../../widget/shred_component/branch_dropdown.dart';
import '../../widget/shred_component/input_form_field.dart';
import '../../widget/shred_component/material_button.dart';
import '../../widget/shred_component/padding_container.dart';

class AddEditCashUser extends StatelessWidget {
  const AddEditCashUser({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddEditCashUserController());
    return Scaffold(
      appBar: AppBar(
        title: Text('addCashUser'.tr),
      ),
      body: PaddingContainer(
        child: GetBuilder<AddEditCashUserController>(builder: (controller) {
          return Form(
            key: controller.formKey,
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              shrinkWrap: true,
              children: [
                InputFormField(
                  hintTitle: 'إسم',
                  controller: controller.nameAr,
                  icon: Icons.account_circle_outlined,
                  validate: (val) {
                    return validInput(val!, 4, 50, 'name');
                  },
                ),
                InputFormField(
                  hintTitle: 'البريد الالكتروني',
                  icon: Icons.alternate_email_rounded,
                  controller: controller.email,
                  iconColor: Colors.purple,
                  validate: (val) {
                    return validInput(val!, 4, 50, 'email');
                  },
                ),
                InputFormField(
                  hintTitle: 'الرقم السري',
                  isPassword: controller.isVisiblePassword,
                  controller: controller.password,
                  onIconTap: controller.showPassword,
                  icon: controller.isVisiblePassword
                      ? FontAwesome.lock_solid
                      : FontAwesome.lock_open_solid,
                  validate: (val) {
                    return validInput(val!, 5, 15, 'password');
                  },
                ),
                BranchDropdown(
                    value: controller.selectedBranch.toString(),
                    onChanged: controller.onDropChanged),
                MaterialCustomButton(
                  onPressed: () => controller.isEdit
                      ? controller.editCashUser()
                      : controller.addCashUser(),
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
