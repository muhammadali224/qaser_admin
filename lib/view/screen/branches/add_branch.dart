import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../controller/branches_controller/branch_add_controller.dart';
import '../../../core/function/valid_input.dart';
import '../../widget/shred_component/input_form_field.dart';
import '../../widget/shred_component/padding_container.dart';

class AddBranch extends StatelessWidget {
  const AddBranch({super.key});

  @override
  Widget build(BuildContext context) {
    AddBranchesController controller = Get.put(AddBranchesController());
    return Scaffold(
      appBar: AppBar(
        title: Text('addBranch'.tr),
      ),
      body: PaddingContainer(
        child: Form(
          key: controller.formKey,
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            shrinkWrap: true,
            children: [
              InputFormField(
                hintTitle: 'إسم الفرع بالعربي',
                icon: Icons.account_circle_outlined,
                validate: (val) {
                  return validInput(val!, 4, 50, 'name');
                },
              ),
              InputFormField(
                hintTitle: 'إسم الفرع بالانجليزي',
                icon: Icons.abc,
                iconColor: Colors.purple,
                validate: (val) {
                  return validInput(val!, 4, 50, 'name');
                },
              ),
              InputFormField(
                hintTitle: 'رقم الهاتف ١',
                keyboardType: TextInputType.phone,
                icon: FontAwesome.phone,
                validate: (val) {
                  return validInput(val!, 10, 15, 'phone');
                },
              ),
              InputFormField(
                hintTitle: 'رقم الهاتف ٢',
                icon: FontAwesome.phone,
                keyboardType: TextInputType.phone,
                iconColor: Colors.green,
                validate: (val) {
                  return validInput(val!, 10, 15, 'phone');
                },
              ),
              InputFormField(
                hintTitle: 'رابط الفيسبوك',
                icon: FontAwesome.facebook_f,
                iconColor: Colors.blue,
                validate: (val) {
                  return validInput(val!, 4, 50, 'name');
                },
              ),
              InputFormField(
                hintTitle: 'رسوم التوصيل لكل كيلومتر',
                icon: FontAwesome.money_bill_1_wave,
                keyboardType: const TextInputType.numberWithOptions(),
                validate: (val) {
                  return validInput(val!, 1, 50, 'name');
                },
              ),
              InputFormField(
                hintTitle: 'مسافة حدود التوصيل بالكيلومتر',
                keyboardType: const TextInputType.numberWithOptions(),
                icon: Icons.social_distance,
                validate: (val) {
                  return validInput(val!, 1, 50, 'name');
                },
              ),
              InputFormField(
                hintTitle: 'رسوم التوصيل الثابته',
                icon: FontAwesome.money_check_dollar,
                keyboardType: const TextInputType.numberWithOptions(),
                iconColor: Colors.teal,
                validate: (val) {
                  return validInput(val!, 1, 50, 'name');
                },
              ),
              InputFormField(
                hintTitle: 'مسافة التوصيل الثابته بالكيلومتر',
                icon: FontAwesome.ruler,
                keyboardType: const TextInputType.numberWithOptions(),
                iconColor: Colors.deepPurpleAccent,
                validate: (val) {
                  return validInput(val!, 1, 50, 'name');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
