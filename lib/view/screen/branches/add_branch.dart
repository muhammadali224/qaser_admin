import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../controller/branches_controller/branch_add_controller.dart';
import '../../../core/function/valid_input.dart';
import '../../widget/shred_component/input_form_field.dart';
import '../../widget/shred_component/material_button.dart';
import '../../widget/shred_component/padding_container.dart';

class AddBranch extends StatelessWidget {
  const AddBranch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(AddBranchesController());

    return Scaffold(
      appBar: AppBar(
        title: Text('addBranch'.tr),
      ),
      body: PaddingContainer(
        child: GetBuilder<AddBranchesController>(builder: (controller) {
          return Form(
            key: controller.formKey,
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              shrinkWrap: true,
              children: [
                PaddingContainer(
                    child: TextButton(
                  onPressed: controller.goToAddAddress,
                  child: const Text(
                    "إضغط هنا لإضافة الموقع",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                )),
                if (controller.latitude != null && controller.longitude != null)
                  Text(
                    "Longitude:${controller.latitude} , Latitude:${controller.latitude}",
                    textAlign: TextAlign.center,
                  ),
                InputFormField(
                  hintTitle: 'إسم الفرع بالعربي',
                  controller: controller.nameAr,
                  icon: Icons.account_circle_outlined,
                  validate: (val) {
                    return validInput(val!, 4, 50, 'name');
                  },
                ),
                InputFormField(
                  hintTitle: 'إسم الفرع بالانجليزي',
                  icon: Icons.abc,
                  controller: controller.nameEn,
                  iconColor: Colors.purple,
                  validate: (val) {
                    return validInput(val!, 4, 50, 'name');
                  },
                ),
                InputFormField(
                  hintTitle: 'رقم الهاتف ١',
                  controller: controller.phone1,
                  keyboardType: TextInputType.phone,
                  icon: FontAwesome.phone,
                  validate: (val) {
                    return validInput(val!, 10, 10, 'phone');
                  },
                ),
                InputFormField(
                  hintTitle: 'رقم الهاتف ٢',
                  icon: FontAwesome.phone,
                  controller: controller.phone2,
                  keyboardType: TextInputType.phone,
                  iconColor: Colors.green,
                  validate: (val) {
                    return validInput(val!, 10, 10, 'phone');
                  },
                ),
                InputFormField(
                  hintTitle: 'رابط الفيسبوك',
                  icon: FontAwesome.facebook_f,
                  iconColor: Colors.blue,
                  controller: controller.facebookUrl,
                  validate: (val) {
                    return validInput(val!, 4, 150, 'name');
                  },
                ),
                InputFormField(
                  hintTitle: 'رسوم التوصيل لكل كيلومتر',
                  labelString: 'رسوم التوصيل لكل كيلومتر',
                  icon: FontAwesome.money_bill_1_wave,
                  controller: controller.deleveryCharge,
                  keyboardType: const TextInputType.numberWithOptions(),
                  validate: (val) {
                    return validInput(val!, 1, 50, 'name');
                  },
                ),
                InputFormField(
                  hintTitle: 'مسافة حدود التوصيل بالكيلومتر',
                  labelString: 'مسافة حدود التوصيل بالكيلومتر',
                  keyboardType: const TextInputType.numberWithOptions(),
                  icon: Icons.social_distance,
                  controller: controller.deleveryMaxZone,
                  validate: (val) {
                    return validInput(val!, 1, 50, 'name');
                  },
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      const Text("التوصيل ثابت :",
                          style: TextStyle(fontSize: 18)),
                      Expanded(
                        child: RadioListTile<int>(
                          title: Text("yes".tr),
                          value: 1,
                          groupValue: controller.selectedOption,
                          onChanged: controller.onChanged,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<int>(
                          title: Text("no".tr),
                          value: 0,
                          groupValue: controller.selectedOption,
                          onChanged: controller.onChanged,
                        ),
                      ),
                    ],
                  ),
                ),
                if (controller.selectedOption == 1)
                  InputFormField(
                    hintTitle: 'رسوم التوصيل الثابته',
                    labelString: 'رسوم التوصيل الثابته',
                    icon: FontAwesome.money_check_dollar,
                    keyboardType: const TextInputType.numberWithOptions(),
                    iconColor: Colors.teal,
                    controller: controller.deliverFixCharge,
                    validate: (val) {
                      if (controller.selectedOption == 1) {
                        return validInput(val!, 1, 50, 'name');
                      }
                      return null;
                    },
                  ),
                if (controller.selectedOption == 1)
                  InputFormField(
                    hintTitle: 'مسافة التوصيل الثابته بالكيلومتر',
                    labelString: 'مسافة التوصيل الثابته بالكيلومتر',
                    icon: FontAwesome.ruler,
                    keyboardType: const TextInputType.numberWithOptions(),
                    iconColor: Colors.deepPurpleAccent,
                    controller: controller.deliveryFixZone,
                    validate: (val) {
                      if (controller.selectedOption == 1) {
                        return validInput(val!, 1, 50, 'name');
                      }
                      return null;
                    },
                  ),
                MaterialCustomButton(
                  onPressed: () => controller.isEdit
                      ? controller.editBranches()
                      : controller.addBranches(),
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
