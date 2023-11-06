import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/users_controller/user_details_controller.dart';
import '../../../core/extension/space_extension.dart';
import '../../../core/function/valid_input.dart';
import '../shred_component/input_form_field.dart';
import '../shred_component/material_button.dart';

class SendNotificationContainer extends GetView<UserDetailsController> {
  final bool isForPoint;
  final void Function() onTap;

  const SendNotificationContainer(
      {required this.isForPoint, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(isForPoint ? "إرسال نقاط كهدية" : "إرسال إشعار",
                style: const TextStyle(fontSize: 22, color: Colors.black)),
          ),
          if (isForPoint)
            InputFormField(
              hintTitle: 'عدد النقاط',
              labelString: 'أدخل عدد النقاط المراد إرسالها',
              controller: controller.pointCountText,
              icon: Icons.redeem_rounded,
              keyboardType: const TextInputType.numberWithOptions(),
              validate: (val) {
                return validInput(val!, 1, 50, 'name');
              },
            ),
          InputFormField(
            hintTitle: 'عنوان الاشعار',
            labelString: 'أدخل عنوان الاشعار',
            controller: controller.titleText,
            icon: Icons.title,
            validate: (val) {
              return validInput(val!, 2, 50, 'name');
            },
          ),
          InputFormField(
            hintTitle: 'نص الاشعار',
            labelString: 'أدخل نص الاشعار',
            controller: controller.bodyText,
            icon: Icons.text_fields,
            isExpanded: true,
            validate: (val) {
              return validInput(val!, 3, 50, 'name');
            },
          ),
          MaterialCustomButton(
            onPressed: onTap,
            title: 'إرسال',
            color: Colors.green,
          ),
          30.height,
        ],
      ),
    );
  }
}
