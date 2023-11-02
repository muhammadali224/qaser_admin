import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../controller/coupon_controller/add_edit_coupon_controller.dart';
import '../../../core/function/pick_date.dart';
import '../../../core/function/valid_input.dart';
import '../../widget/shred_component/branch_dropdown.dart';
import '../../widget/shred_component/input_form_field.dart';
import '../../widget/shred_component/material_button.dart';
import '../../widget/shred_component/padding_container.dart';

class AddEditCoupon extends StatelessWidget {
  const AddEditCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddEditCouponController());
    return Scaffold(
      appBar: AppBar(
        title: Text('addCoupon'.tr),
      ),
      body: PaddingContainer(
        child: GetBuilder<AddEditCouponController>(builder: (controller) {
          return Form(
            key: controller.formKey,
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              shrinkWrap: true,
              children: [
                InputFormField(
                  hintTitle: 'إسم كوبون الخصم',
                  controller: controller.name,
                  icon: Icons.account_circle_outlined,
                  validate: (val) {
                    return validInput(val!, 3, 50, 'name');
                  },
                ),
                InputFormField(
                  hintTitle: 'قيمة الخصم',
                  icon: Icons.discount_outlined,
                  controller: controller.discountValue,
                  iconColor: Colors.purple,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  validate: (val) {
                    return validInput(val!, 1, 50, 'email');
                  },
                ),
                InputFormField(
                  hintTitle: 'عدد الكوبونات',
                  controller: controller.count,
                  keyboardType: TextInputType.number,
                  icon: FontAwesome.coins,
                  validate: (val) {
                    return validInput(val!, 1, 15, 'password');
                  },
                ),
                InputFormField(
                  hintTitle: 'تاريخ البداية',
                  labelString: 'تاريخ البداية',
                  controller: controller.startDate,
                  readOnly: true,
                  icon: FontAwesome.calendar,
                  validate: (val) {
                    return validInput(val!, 1, 15, 'text');
                  },
                ),
                InputFormField(
                  labelString: 'تاريخ النهاية',
                  hintTitle: 'تاريخ النهاية',
                  onTap: () async {
                    await pickDate(context);
                  },
                  readOnly: true,
                  controller: controller.endDate,
                  keyboardType: TextInputType.number,
                  icon: FontAwesome.calendar_check,
                  validate: (val) {
                    return validInput(val!, 1, 15, 'text');
                  },
                ),
                BranchDropdown(
                    value: controller.selectedBranch.toString(),
                    onChanged: controller.onDropChanged),
                MaterialCustomButton(
                  onPressed: () => controller.isEdit
                      ? controller.editCoupon()
                      : controller.addCoupon(),
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
