import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/users_controller/user_details_controller.dart';
import '../../../core/extension/space_extension.dart';
import '../../../core/function/valid_input.dart';
import '../shred_component/input_form_field.dart';
import '../shred_component/material_button.dart';

class SendSMSContainer extends GetView<UserDetailsController> {
  final void Function() onTap;

  const SendSMSContainer({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
              child: Text("إرسال SMS",
                  style: TextStyle(fontSize: 22, color: Colors.black)),
            ),
            InputFormField(
              hintTitle: 'نص الرسالة',
              labelString: 'أدخل الرسالة المراد إرسالها',
              controller: controller.smsBody,
              icon: Icons.sms,
              isExpanded: true,
              validate: (val) {
                return validInput(val!, 1, 550, 'name');
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
      ),
    );
  }
}
